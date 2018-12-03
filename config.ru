# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

run Rails.application

if RAILS_ENV =='production'
    use Rack::Rewrite do
        r301 %r{.*}, 'https://www.uneapp.com$&', :if => Proc.new {|rack_env|
        rack_env['SERVER_NAME'] != 'www.uneapp.com'
        }
    end
end