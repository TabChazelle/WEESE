# app/jobs/search_image_job.rb
class SearchImageJob < ApplicationJob
  queue_as :default

  def perform(wine_name, cheese_name)
    wine = Wine.find_by(name: wine_name)
    cheese = Cheese.find_by(name: cheese_name)

    serpapi_params = {
      tbm: 'isch',
      api_key: ENV.fetch('SERPAPI_API_KEY')
    }

    # Search for wine image
    return if wine && !wine.image_url.start_with?("https://source.unsplash.com/random/")

    serpapi_params[:q] = "#{wine_name} Wine Wikipedia"
    search = GoogleSearch.new(serpapi_params)
    results = search.get_hash

    if results[:images_results]
      wine.update!(image_url: results[:images_results][0][:original])
      p results[:images_results][0][:original]
    else
      puts "Failed to fetch image for wine: #{wine_name}"
      puts "API response: #{results}"
    end

    # Search for cheese image
    return if cheese && !cheese.image_url.start_with?("https://source.unsplash.com/random/")

    serpapi_params[:q] = cheese_name
    search = GoogleSearch.new(serpapi_params)
    results = search.get_hash

    if results[:images_results]
      cheese.update!(image_url: results[:images_results][0][:original])
    else
      puts "Failed to fetch image for cheese: #{cheese_name}"
      puts "API response: #{results}"
    end
  end
end
