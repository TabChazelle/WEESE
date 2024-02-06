class SearchController < ApplicationController
  def index
    @wines = search_wines(params[:query])
    @cheeses = search_cheeses(params[:query])
  end

  private

  def search_wines(query)
    return Wine.none unless query.present?

    Wine.where("name ILIKE :query OR country ILIKE :query OR region ILIKE :query OR family ILIKE :query",
               query: "%#{query}%")
  end

  def search_cheeses(query)
    return Cheese.none unless query.present?

    Cheese.where("name ILIKE :query OR country ILIKE :query OR region ILIKE :query OR milk ILIKE :query",
                 query: "%#{query}%")
  end
end
