class WinesController < ApplicationController
  before_action :set_wine, only: [:show]

  def new
    @wine = Wine.new
  end

  def index
    @wines = Wine.all
  end

  def show
  end

  def toggle_favorite
    wine = Wine.find(params[:id])
    if current_user.favorite_wines.include?(wine)
      current_user.favorite_wines.delete(wine)
    else
      current_user.favorite_wines << wine
    end
    redirect_back fallback_location: root_path
  end

  private

  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:name, :type, :country, :grape, :description)
  end
end
