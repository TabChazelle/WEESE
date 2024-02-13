# app/jobs/search_image_job.rb
class SearchImageJob < ApplicationJob
  queue_as :default

  def perform(wine_id, cheese_id)
    wine = Wine.find(wine_id)
    cheese = Cheese.find(cheese_id)

    serpapi_params = {
      tbm: 'isch',
      api_key: ENV.fetch('SERPAPI_API_KEY')
    }

    # Search for wine image
    serpapi_params[:q] = wine.name
    search = GoogleSearch.new(serpapi_params)
    results = search.get_hash
    wine.update!(image_url: results['images_results'][0]['original']) if results['images_results']

    # Search for cheese image
    serpapi_params[:q] = cheese.name
    search = GoogleSearch.new(serpapi_params)
    results = search.get_hash
    cheese.update!(image_url: results['images_results'][0]['original']) if results['images_results']
  end
end
