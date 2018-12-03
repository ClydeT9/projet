YourAppName::Application.config.middleware.insert_before(Rack::Lock, Rack::Rewrite) do
    r301 %r{.*}, 'https://www.uneapp.com$&', :if => Proc.new {|rack_env|
      rack_env['SERVER_NAME'] != 'https://www.uneapp.com'
    }
  end if Rails.env == 'production'