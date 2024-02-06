class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def index
    @favorite_wines = current_user.favorite_wines
    @favorite_cheeses = current_user.favorite_cheeses
    @favorite_pairings = current_user.favorite_pairings
  end

end
