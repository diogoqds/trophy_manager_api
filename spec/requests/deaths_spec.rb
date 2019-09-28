# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Deaths', type: :request do
  describe 'POST /api/deaths' do
    let(:user) { create(:user) }

    before do
      token = authenticate(user)
      post '/api/deaths',
           headers: { authorization: token }
    end

    it { expect(response).to have_http_status(:created) }
    it { expect(response_body).to have_key('id') }
    it { expect(Death.count).to eq(1) }
    it { expect(response_body['user_id']).to eq(user.id) }
    it { expect(response_body['created_at']).not_to be_nil }
  end
end
