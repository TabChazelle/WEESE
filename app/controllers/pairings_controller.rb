class PairingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pairing = Pairing.new
    @wines = Wine.all
    @cheeses = Cheese.all
  end

  def create
    @pairing = Pairing.new(pairing_params)

    if @pairing.save
      redirect_to @pairing, notice: 'Pairing created successfully'
    else
      render :new
    end
  end

  def index
    @pairings = Pairing.all
  end

  def show
    @pairing = Pairing.find(params[:id])
    @reviews = Review.all
  end


  def toggle_favorite
    pairing = Pairing.find(params[:id])
    if current_user.favorite_pairings.include?(pairing)
      current_user.favorite_pairings.delete(pairing)
    else
      current_user.favorite_pairings << pairing
    end
    redirect_back fallback_location: root_path
  end

  private

  def set_pairings
    @pairing = Pairing.find(params[:id])
  end


  def pairing_params
    params.require(:pairing).permit(:wine_id, :cheese_id)
  end
end
