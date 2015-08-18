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

  def destroy
    session[:user_id] = nil
    @current_user = nil
    respond_to do |format|
      format.js{ render js: "Materialize.toast('Logged Out', 3000); window.location.href = '/';", turbolinks: true}
    end
  end
end
