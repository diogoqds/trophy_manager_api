# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'CollectedCoins', type: :request do
  describe 'POST /api/collected_coins' do
    context 'when params are valid' do
      let(:user) { create(:user) }
      let(:collected_coin_params) do
        {
          value: 1
        }
      end

      before do
        token = authenticate(user)
        post '/api/collected_coins',
             params: { collected_coin: collected_coin_params },
             headers: { authorization: token }
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response_body).to have_key('id') }
      it { expect(CollectedCoin.count).to eq(1) }
      it { expect(response_body['user_id']).to eq(user.id) }
      it { expect(response_body['value']).to eq(1) }
    end

    context 'when params are invalid' do
      let(:user) { create(:user) }
      let(:collected_coin_params) do
        {
          value: ''
        }
      end

      before do
        token = authenticate(user)
        post '/api/collected_coins',
             params: { collected_coin: collected_coin_params },
             headers: { authorization: token }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response_body).to have_key('errors') }
      it { expect(CollectedCoin.count).to eq(0) }
      it { expect(response_body['errors']['value']).to include('não pode ficar em branco') }
    end
  end
end
