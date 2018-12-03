class UserMailer < ActionMailer::Base
    default from: "clyde.thomson@uneapp.com"
  
    def welcome_email(user)
      @user = user
      mail(to: @user.email, subject: 'Sample Email')
    end
  end