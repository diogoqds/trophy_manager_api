# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  # associations
  belongs_to :user
  belongs_to :monster

  # callbacks

  after_save :create_trophy

  def create_trophy
    ActiveRecord::Base.transaction do
      value = user.killed_monsters.where(monster: monster).count
      if value >= 1
        award_entity = AwardEntity.find_by(entity: monster)
        ApplicationRecord.create_trophy(award_entity, user, value)
      end
    end
  end
end
