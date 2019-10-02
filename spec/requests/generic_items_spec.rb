# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GenericItems', type: :request do
  describe 'GET /api/generic_items' do
    let(:user) { create(:user) }

    before do
      create_list(:generic_item, 3)
      token = authenticate(user)
      get '/api/generic_items',
          headers: { authorization: token }
    end

    it { expect(response).to have_http_status(:success) }
    it { expect(response_body).to have_key('generic_items') }
    it { expect(response_body['generic_items'].length).to eq(3) }
    it { expect(response_body['generic_items'].sample).to have_key('id') }
    it { expect(response_body['generic_items'].sample).to have_key('name') }
  end
end
