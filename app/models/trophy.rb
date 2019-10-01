# frozen_string_literal: true

class Trophy < ApplicationRecord
  # associations
  has_many :trophy_users, dependent: :destroy
  has_many :users, through: :trophy_users, dependent: :destroy
  belongs_to :rule

  # delegate
  delegate :description, to: :rule, prefix: false, allow_nil: true
end
