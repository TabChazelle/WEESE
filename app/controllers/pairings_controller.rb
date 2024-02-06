class PairingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @pairing = Pairing.new
    @wines = Wine.all
    @chesses = Cheese.all
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
    @pairing = Pairing.all
    @favorite_pairings = current_user.favorite_pairings
  end

  def show
    @pairing = Pairing.find(params[:id])
  end

  def favorites
    @favorite_pairings = current_user.favorite_pairings
  end

  private

  def pairing_params
    params.require(:pairing).permit(:wine_id, :cheese_id)
  end
end
