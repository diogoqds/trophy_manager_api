# frozen_string_literal: true

class GenericItemUsersController < ApplicationController
  def create
    @generic_item_user = current_user.generic_item_users.new(generic_item_user_params)
    if @generic_item_user.save
      render :show, status: :created
    else
      render_model_errors(@generic_item_user)
    end
  end

  private

  def generic_item_user_params
    params.require(:generic_item_user).permit(:generic_item_id)
  end
end
