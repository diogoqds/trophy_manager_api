# frozen_string_literal: true

class CollectedCoin < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }
end
