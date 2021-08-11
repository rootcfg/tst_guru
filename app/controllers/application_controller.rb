class ApplicationController < ActionController::Base
  add_flash_types :success, :error
  include Pagy::Backend

  helper_method :current_user,
                :logged_in?

  private

  def authenticate_user!
    if !current_user
      redirect_to login_path, alert: "Please enter your email and password"
    end
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end

end
