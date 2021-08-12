class SessionsController < ApplicationController

  skip_before_action :authenticate_user!
  before_action :keep_previous

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to keep_previous || root_path
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

  private

  def keep_previous
    cookies[:redirect_to] ||= request.headers["HTTP_REFERER"]
  end

end
