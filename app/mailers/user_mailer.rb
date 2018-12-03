
class UserMailer < ApplicationMailer
    default from: 'clyde.thomson@uneapp.com'
   
    def welcome_email
      @user = params[:user]
      mail(to: @user.email, subject: 'Welcome to My Awesome Site')
    end
  end