# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to have_many(:collected_coins).dependent(:destroy) }
    it { is_expected.to have_many(:deaths).dependent(:destroy) }
    it { is_expected.to have_many(:killed_monsters).dependent(:destroy) }
    it { is_expected.to have_many(:trophy_users).dependent(:destroy) }
    it { is_expected.to have_many(:trophies).through(:trophy_users).dependent(:destroy) }
  end
end
