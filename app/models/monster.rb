# frozen_string_literal: true

class Monster < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_many :killed_monsters, dependent: :destroy
  has_many :award_entities, as: :entity, dependent: :destroy
end
