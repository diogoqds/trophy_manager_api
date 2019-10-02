# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GenericItem, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { is_expected.to have_many(:generic_item_users) }
  it { is_expected.to have_many(:users).through(:generic_item_users) }
  it { is_expected.to have_many(:award_entities).dependent(:destroy) }
end
