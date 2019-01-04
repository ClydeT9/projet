class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def facebook
    @user = User.create_from_facebook_data(request.env['omniauth.auth'])
    if @user.save
      UserMailer.send_signup_email(@user).deliver
      UserMailer.send_signup_admin(@user).deliver
    end
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Facebook') if is_navigational_format?
    else
      flash[:error] = 'Un problème est survenu lors de votre connexion via Facebook. Veuillez vous inscrire ou essayez de vous connecter plus tard.'
      redirect_to new_user_registration_url
    end 
  end

  def google_oauth2
    @user = User.create_from_google_data(request.env['omniauth.auth'])
    if @user.save
      UserMailer.send_signup_email(@user).deliver
      UserMailer.send_signup_admin(@user).deliver
    end
    if @user.persisted?
      sign_in_and_redirect @user
      set_flash_message(:notice, :success, kind: 'Google') if is_navigational_format?
    else
      flash[:error] = 'Un problème est survenu lors de votre connexion via Google. Veuillez vous inscrire ou essayez de vous connecter plus tard.'
      redirect_to new_user_registration_url
    end 
  end

  def failure
    flash[:error] = 'Un problème est survenu lors de la connexion. Veuillez vous inscrire ou essayez de vous connecter ultérieurement.' 
    redirect_to new_user_registration_url
  end
end