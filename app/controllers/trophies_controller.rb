# frozen_string_literal: true

class TrophiesController < ApplicationController
  def index
    @trophies = current_user.trophies
  end
end
