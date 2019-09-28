# frozen_string_literal: true

class KilledMonstersController < ApplicationController
  def create
    @killed_monster = current_user.killed_monsters.new(killed_monster_params)
    if @killed_monster.save
      render :show, status: :created
    else
      render_model_errors(@killed_monster)
    end
  end

  private

  def killed_monster_params
    params.require(:killed_monster).permit(:monster_id)
  end
end
