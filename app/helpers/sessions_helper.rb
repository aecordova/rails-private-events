module SessionsHelper
  def login(user)
    session[:current_user_id] = user.id
  end

  def logout(_user)
    session[:current_user_id] = nil
  end

  def current_user
    User.find(session[:current_user_id]) unless session[:current_user_id].nil? || !User.exists?(session[:current_user_id])
  end

  def logged_in?
    !current_user.nil?
  end
end
