class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protected
  def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :email, :phone, :contact_type, :role_type, :password, :company_id])
      devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email, :phone, :contact_type, :role_type, :password, :company_id])
  end
  
  #protected
  #  def after_sign_in_path_for(resource)
  #    request.env['omniauth.origin'] || stored_location_for(resource) || users_url
  #  end
  
  #protected
  #  def after_update_path_for(resource)
  #    request.env['omniauth.origin'] || stored_location_for(resource) || users_url
  #  end
end
