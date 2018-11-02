# frozen_string_literal: true

class Editors::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  def create
    resource = Editor.find_for_database_authentication(email: params[:editor][:email])
    return invalid_login_attempt unless resource
  
    if resource.valid_password?(params[:editor][:password])
      sign_in :editor, resource
      return redirect_to root_path
    end
  
    invalid_login_attempt
   end

   protected
   def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    return redirect_to root_path, flash: {loginEditorModal: true }
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
