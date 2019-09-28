# frozen_string_literal: true

require 'json_web_token'

class Authenticate
  prepend SimpleCommand

  def initialize(email, password)
    @email = email
    @password = password
  end

  def call
    JsonWebToken.encode(id: user.id) if user
  end

  private

  def user
    user = User.find_by(email: @email)
    return user if user&.valid_password?(@password)

    errors.add(:authentication, 'invalid credentials')
  end
end
