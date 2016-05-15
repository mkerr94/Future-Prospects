class Users::RegistrationsController < Devise::RegistrationsController

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
  def registration_params
      params.require(:user).permit(:email, :password, :password_confirmation, :forename, :surname, :dob, :perm_address, :perm_postcode, :term_address, :term_postcode, :phone_no, :highest_qualification_level, :highest_qualification_institution, :qualifications, :personal_statement, :referee_id)
  end

end
