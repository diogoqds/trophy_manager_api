# frozen_string_literal: true

FactoryBot.define do
  factory :generic_item do
    sequence(:name) { |n| "GenericItem#{n}" }
  end
end
