# frozen_string_literal: true

class GenericItemUser < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :generic_item

  # validations
  validates :value, presence: true, numericality: { only_integer: true, greater_than: 0 }

  # callbacks

  after_save :create_trophy

  def create_trophy
    ActiveRecord::Base.transaction do
      value = user.generic_item_users.where(generic_item: generic_item).count
      if value >= 1
        award_entity = AwardEntity.find_by(entity: generic_item)
        ApplicationRecord.create_trophy(award_entity, user, value)
      end
    end
  end
end
