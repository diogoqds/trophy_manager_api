# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'KilledMonsters', type: :request do
  describe 'POST /api/killed_monsters' do
    context 'when params are valid' do
      let(:user) { create(:user) }
      let(:monster) { create(:monster) }
      let(:killed_monster_params) do
        {
          monster_id: monster.id
        }
      end

      before do
        token = authenticate(user)
        post '/api/killed_monsters',
             params: { killed_monster: killed_monster_params },
             headers: { authorization: token }
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response_body).to have_key('id') }
      it { expect(KilledMonster.count).to eq(1) }
      it { expect(response_body['user_id']).to eq(user.id) }
      it { expect(response_body['monster_id']).to eq(monster.id) }
    end

    context 'when params are valid' do
      let(:user) { create(:user) }
      let(:killed_monster_params) do
        {
          monster_id: ''
        }
      end

      before do
        token = authenticate(user)
        post '/api/killed_monsters',
             params: { killed_monster: killed_monster_params },
             headers: { authorization: token }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response_body).to have_key('errors') }
      it { expect(KilledMonster.count).to eq(0) }
      it { expect(response_body['errors']['monster']).to include('é obrigatório(a)') }
    end
  end
end
