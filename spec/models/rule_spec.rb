# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Rule, type: :model do
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to validate_numericality_of(:value).only_integer }
  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
  it { is_expected.to belong_to(:award_entity) }
  it { is_expected.to validate_uniqueness_of(:value).scoped_to(:award_entity_id) }
end
