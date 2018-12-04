class UserMailer < ActionMailer::Base
  default :from => 'clyde.thomson@uneapp.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user)
    @user = user
    header "X-SMTPAPI" => {
      sub: {
        "%name" => [@user.email]
      },
      filters: {
        templates: {
          settings: {
            enable: 1,
            template_id: 'd-51a204342561426da7b4527a840f8392'
          }
        }
      }
    }.to_json
    mail( :to => @user.email,
    :subject => 'Merci pour votre inscription !' )
  end
end