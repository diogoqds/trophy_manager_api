# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CollectedCoin, type: :model do
  it { is_expected.to validate_presence_of(:value) }
  it { is_expected.to belong_to(:user) }
  it { is_expected.to validate_numericality_of(:value).only_integer }
  it { is_expected.to validate_numericality_of(:value).is_greater_than(0) }
end
