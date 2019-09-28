# frozen_string_literal: true

class KilledMonster < ApplicationRecord
  belongs_to :user
  belongs_to :monster
end
