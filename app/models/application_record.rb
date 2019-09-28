# frozen_string_literal: true

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create_trophy(award_entity, user, value)
    ActiveRecord::Base.transaction do
      rules = award_entity&.rules&.where(value: 1..value)

      rules&.each do |rule|
        Trophy.find_or_create_by!(user: user, rule: rule)
      end
    end
  end
end
