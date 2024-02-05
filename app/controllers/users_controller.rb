class UsersController < ApplicationController
  before_action :set_user, only: [:profile]
  before_action :authenticate_user!

  def profile
  end

  private

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to(root_path, alert: 'User not found.')
  end

  def user_params
    params.require(:user).permit(:username, :email)
  end
end
