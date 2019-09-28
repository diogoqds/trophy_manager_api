# frozen_string_literal: true

class Death < ApplicationRecord
  # associations
  belongs_to :user

  # callbacks
  after_save :create_trophy

  def create_trophy
    ActiveRecord::Base.transaction do
      award_entity = AwardEntity.find_by(name: model_name.name)
      value = user.deaths.count
      ApplicationRecord.create_trophy(award_entity, user, value) if value >= 1
    end
  end
end
