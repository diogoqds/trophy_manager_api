# frozen_string_literal: true

class AdminController < ActionController::Base
  private

  def after_sign_in_path_for(resource)
    if resource.try(:admin?)
      rails_admin_path
    else
      sign_out
      super
    end
  end

  def after_sign_out_path_for(_resource_or_scope)
    new_user_session_path
  end
end
