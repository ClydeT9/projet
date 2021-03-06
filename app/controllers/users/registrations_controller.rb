class Users::RegistrationsController < Devise::RegistrationsController
  def create
    # Create the user from params
    @user = User.new(sign_up_params)
    if @user.save
      # Deliver the signup email
      UserMailer.send_signup_email(@user).deliver
      UserMailer.send_signup_admin(@user).deliver
      sign_in(@user)
      return redirect_back(fallback_location: root_path)
    else
      render :action => 'new'
    end
  end

  protected
  def update_resource(resource, params)
      resource.update_without_password(params)
  end
  def after_update_path_for(resource)
    edit_user_registration_path(resource)
  end
  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  private
  def sign_up_params
    params[:user][:role_editor] = params[:user] && params[:user][:role_editor] == '0' ? false : true
    params.require(:user).permit(:name, :fullname, :email, :password, :password_confirmation, :role_editor)
  end

  def account_update_params
    params.require(:user).permit(:name, :fullname,:avatar,:job, :email, :password, :password_confirmation, :current_password)
  end

  # GET /resource/sign_up
  # def new
  #   super
  # end

  # POST /resource
  # def create
  # end

  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end
