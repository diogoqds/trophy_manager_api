# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Trophy, type: :model do
  it { is_expected.to belong_to(:rule) }
  it { is_expected.to have_many(:trophy_users) }
  it { is_expected.to have_many(:users).through(:trophy_users) }

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

  describe 'create death trophies' do
    let(:user) { create(:user) }
    let(:death_award) { create(:award_entity, name: 'Death') }

    before do
      create(:rule, value: 1, award_entity: death_award)
      create(:rule, value: 10, award_entity: death_award)
      create(:rule, value: 25, award_entity: death_award)
      create(:rule, value: 50, award_entity: death_award)
      create(:rule, value: 100, award_entity: death_award)

      create_list(:death, 39, user: user)
      user.reload
    end

    it { expect(user.trophies.length).to eq(3) }
  end

  describe 'create killed_monster trophies' do
    context 'when moster is turtle' do
      let(:user) { create(:user) }
      let(:turtle) { create(:monster, name: 'Turtle') }
      let(:turtle_award) { create(:award_entity, name: turtle.name, entity: turtle) }

      before do
        create(:rule, value: 1, award_entity: turtle_award)
        create(:rule, value: 100, award_entity: turtle_award)
        create(:rule, value: 200, award_entity: turtle_award)
        create(:rule, value: 500, award_entity: turtle_award)

        create_list(:killed_monster, 520, user: user, monster: turtle)
        user.reload
      end

      it { expect(user.trophies.length).to eq(4) }
    end

    context 'when moster is bowser' do
      let(:user) { create(:user) }
      let(:bowser) { create(:monster, name: 'Bowser') }
      let(:bowser_award) { create(:award_entity, name: bowser.name, entity: bowser) }

      before do
        create(:rule, value: 1, award_entity: bowser_award)
        create(:rule, value: 100, award_entity: bowser_award)
        create(:rule, value: 200, award_entity: bowser_award)
        create(:rule, value: 500, award_entity: bowser_award)

        create_list(:killed_monster, 520, user: user, monster: bowser)
        user.reload
      end

      it { expect(user.trophies.length).to eq(4) }
    end
  end
end
