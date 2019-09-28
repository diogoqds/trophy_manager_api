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
      ApplicationRecord.create_trophy(award_entity, user, value)
    end
  end
end
