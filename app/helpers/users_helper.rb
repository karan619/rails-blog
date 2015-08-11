module UsersHelper
  def create_login(params)
    user = User.create!(params)
    login user
    user
  end
end
