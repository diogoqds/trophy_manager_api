# frozen_string_literal: true

class Monster < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
end
