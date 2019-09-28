# frozen_string_literal: true

module AuthenticateUserHelper
  def authenticate(user, password = 'secret')
    post '/api/session',
         params: {
           session: {
             email: user.email,
             password: password
           }
         }

    "Bearer #{response_body['token']}"
  end
end

RSpec.configure do |config|
  config.include AuthenticateUserHelper, type: :request
end
