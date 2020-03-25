class SessionsController < ApplicationController
  def index; end

  def new; end

  def create
    if (@user = User.find_by(email: params[:email]))
      login @user
      redirect_to @user
    else
      flash[:error] = "User doesn't exist"
      redirect_to login_path
    end
  end

  def destroy
    logout current_user if logged_in?
    redirect_to login_path
  end
end
