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
<<<<<<< HEAD
    @pairing = Pairing.all

=======
    @pairings = Pairing.all
    @favorite_pairings = current_user.favorite_pairings
>>>>>>> f47f01bce045f15719db99fff6f533c7afce1b1a
  end

  def show
    @pairing = Pairing.find(params[:id])
  end


  private

  def pairing_params
    params.require(:pairing).permit(:wine_id, :cheese_id)
  end
end
