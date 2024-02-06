class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_wines = current_user.favorite_wines
    @favorite_cheeses = current_user.favorite_cheeses
    @favorite_pairings = current_user.favorite_pairings
  end

  def create
    favorite = current_user.favorites.build(favorite_params)
    if favorite.save
      redirect_to root_path, notice: 'Item added to favorites'
    else
      redirect_to root_path, alert: 'Failed to add item to favorites'
    end

    def destroy
      favorite = current_user.favorites.find_by(id: params[:id])
      if favorite
        favorite.destroy
        redirect_to root_path, notice: 'Item removed from favorites'
      else
        redirect_to root_path, alert: 'Failed to remove item from favorites'
      end
    end

    private

    def favorite_params
      params.require(:favorite).permit(:wine_id, :cheese_id, :pairing_id)
    end
  end
end
