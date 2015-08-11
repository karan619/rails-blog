module ApplicationHelper
  def logged_in?
    !session[:user_id].nil?
  end

  def current_user
    return nil unless logged_in?
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def login(user)
    session[:user_id] = user.id
  end
end
