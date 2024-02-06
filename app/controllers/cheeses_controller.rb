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

  private

  def set_cheese
    @cheese = Cheese.find(params[:id])
  end

  def cheese_params
    params.require(:cheese).permit(:name, :type, :country, :region, :milk, :description)
  end
end
