class UsersController < ApplicationController
  before_action :authenticate_user!

  def profile
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
