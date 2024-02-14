class WinesController < ApplicationController
  before_action :set_wine, only: [:show]
  helper_method :team_selection_wines

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


  def team_selection_wines
    # Define an array of wines for the Team Selection section
    selected_wines = [
      Wine.find_by(name: "Chablis"),
      Wine.find_by(name: "Petrus"),
      Wine.find_by(name: "Screaming Eagle"),
      Wine.find_by(name: "Pingus"),
      Wine.find_by(name: "Sassicaia"),
      Wine.find_by(name: "Château d’Yquem"),
      Wine.find_by(name: "La Villagoise"),
      Wine.find_by(name: "Escudo Rojo"),
      # Add more wines as needed
    ].compact # Compact to remove nil values if a wine is not found
  end

  def by_country
    @wines = Wine.where(country: params[:country])
  end

  private

  def set_wine
    @wine = Wine.find(params[:id])
  end

  def wine_params
    params.require(:wine).permit(:name, :type, :country, :grape, :description)
  end
end
