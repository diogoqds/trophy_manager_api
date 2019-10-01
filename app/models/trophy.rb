# frozen_string_literal: true

class Trophy < ApplicationRecord
  # associations
  has_many :trophy_users
  has_many :users, through: :trophy_users
  belongs_to :rule

  # delegate
  delegate :description, to: :rule, prefix: false, allow_nil: true
end
