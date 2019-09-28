# frozen_string_literal: true

class CollectedCoinsController < ApplicationController
  def create
    @collected_coin = current_user.collected_coins.new(collected_coin_params)
    if @collected_coin.save
      render :show, status: :created
    else
      render_model_errors(@collected_coin)
    end
  end

  private

  def collected_coin_params
    params.require(:collected_coin).permit(:value)
  end
end
