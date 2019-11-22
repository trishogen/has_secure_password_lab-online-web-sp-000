class UsersController < ApplicationController

  def new
  end

  def create
    if params[:password] != params[:password_confirmation]
      redirect_to signup_path
    end
    
    @user = User.create(user_params)
    if @user
      session[:user_id] = @user.id
    else
      redirect_to signup_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :password, :password_confirmation)
  end
end
