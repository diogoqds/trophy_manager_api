# frozen_string_literal: true

FactoryBot.define do
  factory :generic_item_user do
    user
    generic_item
  end
end
