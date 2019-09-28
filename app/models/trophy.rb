# frozen_string_literal: true

class Trophy < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :rule

  # delegate
  delegate :description, to: :rule, prefix: false, allow_nil: true
end
