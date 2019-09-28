# frozen_string_literal: true

class ApplicationController < ActionController::API
  before_action :authenticate_request

  private

  def authenticate_request
    render json: { error: 'Not Authorized' }, status: :unauthorized unless current_user
  end

  def render_model_errors(model, status = :unprocessable_entity)
    render json: {
      message: model.errors.full_messages.first,
      full_messages: model.errors.full_messages,
      errors: model.errors
    }, status: status
  end

  protected

  def current_user
    AuthorizeRequest.call(request.headers).result
  end
end
