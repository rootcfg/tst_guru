class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :blue

  include Pagy::Backend
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    if current_user.is_admin?
      admin_tests_path
      else current_user.is_admin?
      root_path
      end
  end

end
