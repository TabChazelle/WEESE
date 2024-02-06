class CheesesController < ApplicationController
  before_action :set_cheese, only: [:show]
  def new
    @cheese = Cheese.new
  end

  def index
    @cheeses = Cheese.all
    if params[:query].present?
      sql_subquery = "name ILIKE :query OR type ILIKE :query OR country ILIKE :query"
      @cheeses = @cheeses.where(sql_subquery, query: "%#{params[:query]}%")
    else
      @cheeses = Cheese.all
    end
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
