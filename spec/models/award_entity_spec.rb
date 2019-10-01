# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AwardEntity, type: :model do
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name).ignoring_case_sensitivity }
  it { is_expected.to belong_to(:entity).optional }
  it { is_expected.to have_many(:rules).dependent(:destroy) }

  describe '#check_name' do
    context 'when entity is nil' do
      let(:award_entity) { build(:award_entity, name: 'TableNotExist') }

      it { expect(award_entity).not_to be_valid }
    end

    context 'when entity is not nil' do
      let(:monster) { create(:monster) }
      let(:award_entity) { build(:award_entity, name: monster.name, entity: monster) }

      it { expect(award_entity).to be_valid }
    end
  end
end
