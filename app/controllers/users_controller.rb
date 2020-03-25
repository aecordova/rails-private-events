class UsersController < ApplicationController
  def new; end
  def show
    @user = User.find(params[:id])
  end
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
    else
      render html:"Not Created"
    end
  end

  def user_params
    params.require(:user).permit(:name,:email)
  end
end
