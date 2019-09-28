# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trophy, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to belong_to(:rule) }

  describe 'create coin trophies' do
    let(:user) { create(:user) }
    let(:collected_coin_award) { create(:award_entity, name: 'CollectedCoin') }

    before do
      create(:rule, value: 1, award_entity: collected_coin_award)
      create(:rule, value: 10, award_entity: collected_coin_award)
      create(:rule, value: 1000, award_entity: collected_coin_award)
      create(:rule, value: 10_000, award_entity: collected_coin_award)
      create(:rule, value: 100_000, award_entity: collected_coin_award)

      create(:collected_coin, value: 100_000, user: user)
      user.reload
    end

    it { expect(user.trophies.length).to eq(5) }
  end
end
