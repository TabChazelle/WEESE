class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_wines = @user.all_favorites.select { |favorite| favorite.favoritable_type == 'Wine' }
    @favorite_cheeses = @user.all_favorites.select { |favorite| favorite.favoritable_type == 'Cheese' }
    @favorite_pairings = @user.all_favorites.select { |favorite| favorite.favoritable_type == 'Pairing' }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
