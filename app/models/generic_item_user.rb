# frozen_string_literal: true

class GenericItemUser < ApplicationRecord
  belongs_to :user
  belongs_to :generic_item
end
