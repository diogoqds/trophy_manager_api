# frozen_string_literal: true

FactoryBot.define do
  factory :monster do
    sequence(:name) { |n| "Monster#{n}" }
  end
end
