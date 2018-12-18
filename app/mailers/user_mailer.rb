class UserMailer < ActionMailer::Base
  default :from => '"Bienvenue sur uneapp" <clyde.thomson@uneapp.com>'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail(to: @user.email, subject: 'Inscription réussie sur uneapp')
  end
  
  def send_signup_admin(user)
    @user = User.find(1)
    mail(to: @user.email, subject: 'Inscription UNEAPP')
  end
end