class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) << :forename
    devise_parameter_sanitizer.for(:account_update) << :surname
    devise_parameter_sanitizer.for(:account_update) << :perm_address
    devise_parameter_sanitizer.for(:account_update) << :perm_postcode
    devise_parameter_sanitizer.for(:account_update) << :term_address
    devise_parameter_sanitizer.for(:account_update) << :term_postcode
    devise_parameter_sanitizer.for(:account_update) << :phone_no
    devise_parameter_sanitizer.for(:account_update) << :highest_qualification_level
    devise_parameter_sanitizer.for(:account_update) << :highest_qualification_institution
    devise_parameter_sanitizer.for(:account_update) << :personal_statement
  end

end
