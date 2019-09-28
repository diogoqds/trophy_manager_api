# frozen_string_literal: true

class UsersController < ApplicationController
  skip_before_action :authenticate_request

  def create
    @user = User.new(user_params)

    if @user.save
      render :show, status: 201
    else
      render_model_errors(@user)
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
