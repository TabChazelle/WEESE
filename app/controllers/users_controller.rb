class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:edit_favorites, :my_reviews, :profile]

  def profile
    @user = current_user
  end

  def favorites
    @user = current_user
    authorize @user, :favorites?
    @favorite_wines = @user.all_favorites.select { |favorite| favorite.favoritable_type == 'Wine' }
    @favorite_cheeses = @user.all_favorites.select { |favorite| favorite.favoritable_type == 'Cheese' }
    @favorite_pairings = @user.all_favorites.select { |favorite| favorite.favoritable_type == 'Pairing' }
  end

  def edit_favorites
    @favorite_wines = current_user.favorite_wines
    @favorite_cheeses = current_user.favorite_cheeses
    @favorite_pairings = current_user.favorite_pairings
  end

  def my_reviews
    @user = current_user
    # authorize @user, :my_reviews?
    @reviews = @user.reviews
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :photo)
  end
end
