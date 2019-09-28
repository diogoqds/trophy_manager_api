# frozen_string_literal: true

class AwardEntity < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
  # associations
  belongs_to :entity, polymorphic: true, optional: true
  has_many :rules, dependent: :destroy

  # delegate
  delegate :award_entity_name, to: :name, prefix: true, allow_nil: true
end
