class UserMailer < ApplicationMailer
    default from: 'clyde.thomson@uneapp.com'

    def send_signup_email(user)
      @user = user
      mail(to: @user.email, subject: "Welcome to our app!")
    end
  end