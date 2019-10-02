# frozen_string_literal: true

class GenericItemsController < ApplicationController
  def index
    @generic_items = GenericItem.all
  end
end
