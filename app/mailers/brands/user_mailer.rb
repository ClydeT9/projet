class Brands::UserMailer < ApplicationMailer
    # Send Welcome Email once Member confirms the account
    def welcome_email(member)
      @user = user
      mail(to: @user.email, subject: "Welcome to Skreem! Now you Rock!")
    end
  end