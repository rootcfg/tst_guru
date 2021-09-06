class ApplicationController < ActionController::Base
  add_flash_types :success, :error, :blue

  include Pagy::Backend
  before_action :authenticate_user!
  before_action :set_locale

  #https://api.rubyonrails.org/v6.1.4/classes/ActionDispatch/Routing/Mapper/Base.html#method-i-default_url_options
  def default_url_options
    I18n.locale == I18n.default_locale ? {} : {lang: I18n.locale}
  end

  private

  def set_locale
    I18n.locale = I18n.locale_available?(params[:lang]) ? params[:lang] : I18n.default_locale
  end

  def after_sign_in_path_for(user)
    if current_user.is_admin?
      admin_tests_path
    else
      super
    end
  end

end
