class UserMailer < ActionMailer::Base
  default :from => 'clyde.thomson@uneapp.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    mail( :to => @user.email,
    :subject => 'Merci pour votre inscription !' )
  end
end