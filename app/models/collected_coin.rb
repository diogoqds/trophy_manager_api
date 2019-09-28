# frozen_string_literal: true

class CollectedCoin < ApplicationRecord
  # associations
  belongs_to :user

  # validations
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # callbacks
  after_save :create_trophy

  def create_trophy
    ActiveRecord::Base.transaction do
      award_entity = AwardEntity.find_by(name: model_name.name)
      value = user.collected_coins.pluck(:value).sum
      coin_rules = award_entity&.rules&.where(value: 1..value)
      coin_rules&.each do |coin_rule|
        Trophy.find_or_create_by!(
          user: user,
          rule: coin_rule
        )
      end
    end
  end
end
