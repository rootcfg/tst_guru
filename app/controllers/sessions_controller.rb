class SessionsController < ApplicationController

  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to keep_previous
    else
      flash.now[:alert] = "You are not authorized!"
      render :new
    end
  end

  def destroy
     session.delete(:user_id)
     @current_user = nil
     flash[:blue] = "Comeback plz!"
     redirect_to login_path
  end
end
