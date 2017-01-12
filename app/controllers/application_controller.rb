class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = t "flash.access_denied"
    redirect_to root_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit :sign_up, keys: [:name, :email, :address,
      :phone, :password, :password_confirmation]
    devise_parameter_sanitizer.permit :account_update, keys: [:name, :email,
      :phone, :address, :password, :password_confirmation, :current_password]
  end
end
