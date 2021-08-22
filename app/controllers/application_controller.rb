class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :blue

  include Pagy::Backend
  before_action :authenticate_user!

  private

  def after_sign_in_path_for(resource)
    if current_user.kind_of?(Admin)
      '/admin/tests'
    elsif current_user.kind_of?(User)
      root_path
    else
      root_path
    end
  end

end
