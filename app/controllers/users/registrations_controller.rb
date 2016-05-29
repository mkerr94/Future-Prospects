class Users::RegistrationsController < Devise::RegistrationsController

  # Custom registrations controller
  # Over riding default devise code to whitelist additional parameters

  # Create method from the Devise github repo
  def create
    build_resource(registration_params)

    if resource.save
      if resource.active_for_authentication?
        set_flash_message :notice, :signed_up if is_navigational_format?
        sign_up(resource_name, resource)
        respond_with resource, :location => after_sign_up_path_for(resource)
      else
        set_flash_message :notice, :"signed_up_but_#{resource.inactive_message}" if is_navigational_format?
        respond_with resource, :location => after_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      respond_with resource
    end
  end

  private
  # Additional parameters to be saved upon registration
  def registration_params
      params.require(:user).permit(:email, :password, :password_confirmation, :forename, :surname, :date_of_birth, :perm_address, :perm_postcode, :term_address, :term_postcode, :phone_no, :highest_qualification_level, :highest_qualification_institution, :qualifications, :personal_statement, :referee_id)
  end

end
