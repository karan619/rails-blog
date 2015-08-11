class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user and user.password.eql?(params[:session][:password])
      login(user)
      redirect_to root_url
    else
      render 'new'
    end
  end
end
