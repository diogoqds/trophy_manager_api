# frozen_string_literal: true

class Rule < ApplicationRecord
  # associations
  belongs_to :award_entity
  has_many :trophies, dependent: :destroy

  # validations
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 },
                    uniqueness: { scope: :award_entity_id }

  # delegate
  delegate :description, to: :description, prefix: true, allow_nil: true
  delegate :name, to: :award_entity, prefix: true, allow_nil: true

  # methods

  def description
    "#{value} #{award_entity_name}"
  end
end
