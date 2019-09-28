# frozen_string_literal: true

class MonstersController < ApplicationController
  def index
    @monsters = Monster.all
  end
end
