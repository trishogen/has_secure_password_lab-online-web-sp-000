class SessionsController < ApplicationController
  def new
  end

  def create

    @user = User.find_by(name: params[:user][:name])
    if @user
      return head(:forbidden) unless @user.authenticate(params[:password])
      raise @user.inspect
      session[:user_id] = @user.id
    else
     redirect_to login_path
    end
  end


end
