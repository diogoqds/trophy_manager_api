# frozen_string_literal: true

class Rule < ApplicationRecord
  # associations
  belongs_to :award_entity
  # validations
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: { scope: :award_entity_id }
end
