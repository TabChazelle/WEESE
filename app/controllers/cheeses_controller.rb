class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show]
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

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end

  def cheese_params
    params.require(:cheese).permit(:name, :type, :country, :region, :milk, :description)
  end
end
