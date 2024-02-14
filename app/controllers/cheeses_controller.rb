class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show]
  helper_method :team_selection_cheeses

  def new
    @cheese = Cheese.new
  end

  def index
    @cheeses = Cheese.all
  end

  def show
  end

  def toggle_favorite
    cheese = Cheese.find(params[:id])
    if current_user.favorite_cheeses.include?(cheese)
      current_user.favorite_cheeses.delete(cheese)
    else
      current_user.favorite_cheeses << cheese
    end
    redirect_back fallback_location: root_path
  end

  def team_selection_cheeses
    # Define an array of cheeses for the Team Selection section
    selected_cheeses = [
      Cheese.find_by(name: "Comté"),
      Cheese.find_by(name: "Maroilles"),
      Cheese.find_by(name: "Cheddar"),
      Cheese.find_by(name: "Gouda"),
      Cheese.find_by(name: "Brie"),
      Cheese.find_by(name: "Roquefort"),
      Cheese.find_by(name: "Easy Cheese"),
      Cheese.find_by(name: "Feta"),
      Cheese.find_by(name: "Parmesan"),
      Cheese.find_by(name: "Camembert"),


      # Add more cheeses as needed
    ].compact # Compact to remove nil values if a cheese is not found

    puts selected_cheeses.inspect # Debug statement

  selected_cheeses
  end

  def by_country
    @cheeses = Cheese.where(country: params[:country])
  end

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end

  def cheese_params
    params.require(:cheese).permit(:name, :type, :country, :region, :milk, :description)
  end
end
