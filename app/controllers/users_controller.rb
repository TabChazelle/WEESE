class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  def favorites
    @user = User.find(params[:id])
    @favorite_wines = @user.all_favorites.map { |favorite| Wine.find(favorite.favoritable_id) }
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
