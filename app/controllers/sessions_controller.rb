class SessionsController < ApplicationController
  def new
  end

  def create
    raise params.inspect
    @user = User.find_by(name: params[:name])
    #if @user
    #  return head(:forbidden) unless @user.authenticate(params[:password])
      session[:user_id] = @user.id
    #else
    #  redirect_to login_path
    #end
  end


end
