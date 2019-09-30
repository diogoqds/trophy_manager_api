# frozen_string_literal: true

class AwardEntity < ApplicationRecord
  # validations
  validates :name, presence: true, uniqueness: true
  # associations
  belongs_to :entity, polymorphic: true, optional: true
  has_many :rules, dependent: :destroy

  # delegate
  delegate :award_entity_name, to: :name, prefix: true, allow_nil: true

  # callbacks
  before_validation :check_name

  def check_name
    tables_name = ActiveRecord::Base.connection.tables.map { |t| t.camelize.singularize }
    errors.add(:name) unless tables_name.include?(name)
  end
end
