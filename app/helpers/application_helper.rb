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

  def tags
    return %w(a script img ('h1'..'h6').to_a.join(' ') div p strong li ol ul em hr br)
  end

  def attr
    return %w(src href alt title target)
  end
end
