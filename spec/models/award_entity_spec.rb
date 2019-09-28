# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AwardEntity, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { is_expected.to belong_to(:entity).optional }
  it { is_expected.to have_many(:rules).dependent(:destroy) }
end