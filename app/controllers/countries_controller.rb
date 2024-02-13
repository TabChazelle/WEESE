class CountriesController < ApplicationController
  def show
    @country = params[:id] # Assuming the country name is passed as the ID parameter
    @cheeses = Cheese.where(country: @country)
    @wines = Wine.where(country: @country)

    # Determine the source based on the request or any other logic you have
    @source = params[:source] || "cheese"

    respond_to do |format|
      format.html # Render HTML view
    end
  end
end
