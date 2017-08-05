class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :check_permitted_parametes, if: :devise_controller?

  protected

  def check_permitted_parametes
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:fullname])
  	devise_parameter_sanitizer.permit(:account_update, keys: [:fullname, 
                                                              :phone_number, 
                                                              :description])
  end
end
