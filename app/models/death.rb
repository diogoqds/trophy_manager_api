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
      if value >= 1
        death_rules = award_entity&.rules&.where(value: 1..value)
        death_rules&.each do |death_rule|
          Trophy.find_or_create_by!(user: user, rule: death_rule)
        end
      end
    end
  end
end
