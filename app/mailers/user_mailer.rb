class UserMailer < ActionMailer::Base
    default from: "clyde.thomson@uneapp.com"
  
    def welcome_email(user)
      @user = user
from = SendGrid::Email.new(email: 'clyde.thomson@uneapp.com')
to = SendGrid::Email.new(email: 'clyde.thomson@uneapp.com')
subject = 'Sending with SendGrid is Fun'
content = SendGrid::Content.new(type: 'text/plain', value: 'and easy to do anywhere, even with Ruby')
mail = SendGrid::Mail.new(from, subject, to, content)

sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'])
response = sg.client.mail._('send').post(request_body: mail.to_json)
puts response.status_code
puts response.body
puts response.parsed_body
puts response.headers
    end
  end