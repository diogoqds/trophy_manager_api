# frozen_string_literal: true

class TrophyUser < ApplicationRecord
  belongs_to :user
  belongs_to :trophy
end
