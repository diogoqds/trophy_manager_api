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
        monster_rules = award_entity&.rules&.where(value: 1..value)
        monster_rules&.each do |monster_rule|
          Trophy.find_or_create_by!(
            user: user,
            rule: monster_rule
          )
        end
      end
    end
  end
end
