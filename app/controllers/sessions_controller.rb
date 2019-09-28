# frozen_string_literal: true

class SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    command = Authenticate.call(session_params[:email], session_params[:password])
    if command.success?
      render json: { token: command.result }, status: :created
    else
      render json: { message: 'Email ou senha inválidos', error: command.errors }, status: 401
    end
  end

  private

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
