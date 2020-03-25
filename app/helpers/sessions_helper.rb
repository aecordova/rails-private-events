module SessionsHelper
  def login user
    session[:current_user_id] = user.id
  end

  def current_user
    User.find(session[:current_user_id])
  end
end
