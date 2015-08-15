class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  include ApplicationHelper

  def verify_logged_in?
    if request.xhr?
      render :js => "window.location.href = '/login';" unless logged_in?
    else
      redirect_to login_path unless logged_in?
    end
    flash[:notice] = "Login to continue"
  end
end
