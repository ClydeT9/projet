class Users::SessionsController < Devise::SessionsController

  # permet de rouvrir le modal si mauvais mot de passe et redirection (voir également un script dans application.html)
  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource
  
    if resource.valid_password?(params[:user][:password])
      sign_in :user, resource
      return redirect_back(fallback_location: root_path)
    end
  
    invalid_login_attempt
   end

   protected
   def invalid_login_attempt
    set_flash_message(:alert, :invalid)
    return redirect_to root_path, flash: {logInModal: true }
  end

end 