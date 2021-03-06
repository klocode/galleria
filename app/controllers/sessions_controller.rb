class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by(username: params[:session][:username])
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      flash[:success] = "Welcome #{@user.username}!"
      redirect_to root_path
    else
      flash[:danger] = "Incorrect credentials. Please try again."
      redirect_to :signin
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully!"
    redirect_to root_path
  end

end
