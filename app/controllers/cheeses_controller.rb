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
    @cheese = Cheese.find(params[:id])

    if current_user.favorited?(@cheese)
      current_user.unfavorite(@cheese)
      redirect_to @cheese, notice: 'cheese removed from favorites'
    else
      current_user.favorite(@cheese)
      redirect_to @cheese, notice: 'cheese added to favorites'
    end
  end

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end

  def cheese_params
    params.require(:cheese).permit(:name, :type, :country, :region, :milk, :description)
  end
end
