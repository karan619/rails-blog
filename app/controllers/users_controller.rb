class UsersController < ApplicationController
  include UsersHelper
  def new
    @user = User.new
  end
  def create
    redirect_to root_url if create_login(user_params)
  end
  def show
    @user = User.find(params[:id])
  end
private
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
