class SessionsController < ApplicationController

  def create
    @user = User.find_by_email(params[:email])
    if @user && @user.authenticate(params[:password])
      flash[:notice] = 'Signed in'
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = 'Error signing in'
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = 'Signed out'
    redirect_to '/'
  end

end
