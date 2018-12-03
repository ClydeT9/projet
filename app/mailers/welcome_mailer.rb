class WelcomeMailer < ApplicationMailer
    def welcome_send(user)
        @user = user
        mail to: user.email, subjuct 'Welcome', from:'clyde.thomson@uneapp.com'
    end
end
