# frozen_string_literal: true

class DeathsController < ApplicationController
  def create
    @death = current_user.deaths.new
    if @death.save
      render :show, status: :created
    else
      render_model_errors(@death)
    end
  end
end
