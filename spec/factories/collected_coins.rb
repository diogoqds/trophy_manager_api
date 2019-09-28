# frozen_string_literal: true

FactoryBot.define do
  factory :collected_coin do
    user
    value { 1 }
  end
end
