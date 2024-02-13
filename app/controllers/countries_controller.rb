class CountriesController < ApplicationController
  def show_cheeses
    @country = params[:country_name]
    @cheeses = Cheese.where(country: @country)
  end
end
