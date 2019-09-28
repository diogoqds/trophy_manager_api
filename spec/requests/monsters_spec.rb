# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Monsters', type: :request do
  describe 'GET /api/monsters' do
    let(:user) { create(:user) }

    before do
      create_list(:monster, 3)
      token = authenticate(user)
      get '/api/monsters',
          headers: { authorization: token }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(response_body).to have_key('monsters') }
    it { expect(response_body['monsters'].length).to eq(3) }
    it { expect(response_body['monsters'].sample).to have_key('id') }
    it { expect(response_body['monsters'].sample).to have_key('name') }
  end
end
