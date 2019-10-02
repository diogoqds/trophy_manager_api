# frozen_string_literal: true

class GenericItem < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true

  # associations
  has_many :generic_item_users, dependent: :destroy
  has_many :users, through: :generic_item_users, dependent: :destroy
  has_many :award_entities, as: :entity, dependent: :destroy
end
