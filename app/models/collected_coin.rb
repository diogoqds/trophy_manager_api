# frozen_string_literal: true

class CollectedCoin < ApplicationRecord
  belongs_to :user
  validates :value, presence: true
end
