class SessionsController < ApplicationController
  def new; end

  def create
    if (@user = User.find_by(email: params[:email]))
      login @user
      redirect_to @user
    else
      flash.now[:danger] = "User doesn't exist"
    end
  end

  def destroy
    logout current_user if logged_in?
    redirect_to login_path
  end
end
