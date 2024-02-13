class SearchController < ApplicationController
  def index
    query = params[:query]
    @wines = Wine.search(query, where: search_conditions(params, "Wine"), limit: 10, load: false)
    @cheeses = Cheese.search(query, where: search_conditions(params, "Cheese"), limit: 10, load: false)
  end

  def autocomplete
    query = params[:query]
    wines = Wine.search(query, fields: [{name: :word_start}], limit: 5, load: false, misspellings: {below: 5}).map(&:name)
    cheeses = Cheese.search(query, fields: [{name: :word_start}], limit: 5, load: false, misspellings: {below: 5}).map(&:name)
    render json: { wines: wines, cheeses: cheeses }
  end

  private

  def search_conditions(params, type)
    conditions = {}
    conditions[:country] = params[:country] if params[:country].present? && params[:country] != 'All'
    conditions[:region] = params[:region] if params[:region].present? && params[:region] != 'All'
    conditions
  end
end
