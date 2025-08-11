class Users::RegistrationsController < Devise::RegistrationsController
  def new
    build_resource
    resource.nickname = ::Faker::JapaneseMedia::StudioGhibli.unique.character
    respond_with resource
  end

  def create
    build_resource(sign_up_params)
    resource.nickname = ::Faker::JapaneseMedia::StudioGhibli.unique.character if resource.nickname.blank?
    resource.save
    yield resource if block_given?
    if resource.persisted?
      if resource.active_for_authentication?
        set_flash_message! :notice, :signed_up
        sign_up(resource_name, resource)
        respond_with resource, location: after_sign_up_path_for(resource)
      else
        set_flash_message! :notice, :"signed_up_but_#{resource.inactive_message}"
        expire_data_after_sign_in!
        respond_with resource, location: after_inactive_sign_up_path_for(resource)
      end
    else
      clean_up_passwords resource
      set_minimum_password_length
      respond_with resource
    end
  end

  protected

  def update_resource(resource, params)
    if params[:email] && params[:email] != resource.email
      resource.unconfirmed_email = params[:email]
      resource.save(validate: false)
      true
    else
      resource.update_with_password(params)
    end
  end

  private

  def sign_up_params
    params.require(:user).permit(:email, :password, :password_confirmation, :nickname)
  end

  def account_update_params
    params.require(:user).permit(:email, :nickname, :current_password, :password, :password_confirmation)
  end
end
