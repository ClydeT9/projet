class UserMailer < ActionMailer::Base
  
	def welcome_email(user)
        from = Email.new(email: 'clyde.thomson@uneapp.com')
        subject = 'Hello World from the SendGrid Ruby Library'
        to = Email.new(email: 'clyde.thomson@uneapp.com')
        content = Content.new(type: 'text/plain', value: 'some text here')
        mail = SendGrid::Mail.new(from, subject, to, content)
        # puts JSON.pretty_generate(mail.to_json)
        puts mail.to_json
      
        sg = SendGrid::API.new(api_key: ENV['SENDGRID_API_KEY'], host: 'https://api.sendgrid.com')
        response = sg.client.mail._('send').post(request_body: mail.to_json)
        puts response.status_code
        puts response.body
        puts response.headers
      end

  end