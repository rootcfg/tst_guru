class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :blue
  before_action :authenticate_user!
  before_action :keep_previous

  include Pagy::Backend

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    if !current_user
      redirect_to login_path, alert: "Please enter your email and password"
    end
  end

  def keep_previous
    cookies[:redirect_to] ||= request.headers["HTTP_REFERER"]
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
