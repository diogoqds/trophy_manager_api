# frozen_string_literal: true

class AwardEntity < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
  # associations
  belongs_to :entity, polymorphic: true, optional: true
  has_many :rules, dependent: :destroy
end
