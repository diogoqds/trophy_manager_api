# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Trophies', type: :request do
  describe 'GET /api/trophies' do
    let(:user) { create(:user) }
    let(:coin_award) { create(:award_entity, name: 'CollectedCoin') }
    let(:death_award) { create(:award_entity, name: 'Death') }

    before do
      create(:rule, value: 1, award_entity: coin_award)
      create(:rule, value: 10, award_entity: coin_award)
      create(:rule, value: 1, award_entity: death_award)
      create(:rule, value: 5, award_entity: death_award)
      create_list(:collected_coin, 15, user: user)
      create_list(:death, 7, user: user)
      token = authenticate(user)
      get '/api/trophies',
          headers: { authorization: token }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(response_body).to have_key('trophies') }
    it { expect(response_body['trophies'].length).to eq(4) }
    it { expect(response_body['trophies'].sample).to have_key('id') }
    it { expect(response_body['trophies'].sample).to have_key('description') }
  end
end
