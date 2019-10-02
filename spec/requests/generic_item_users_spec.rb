# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'GenericItemUsers', type: :request do
  describe 'POST /api/generic_item_users' do
    context 'when params are valid' do
      let(:user) { create(:user) }
      let(:generic_item) { create(:generic_item) }
      let(:generic_item_user_params) do
        {
          generic_item_id: generic_item.id
        }
      end

      before do
        token = authenticate(user)
        post '/api/generic_item_users',
             params: { generic_item_user: generic_item_user_params },
             headers: { authorization: token }
      end

      it { expect(response).to have_http_status(:created) }
      it { expect(response_body).to have_key('id') }
      it { expect(GenericItemUser.count).to eq(1) }
      it { expect(response_body['user_id']).to eq(user.id) }
      it { expect(response_body['generic_item_id']).to eq(generic_item.id) }
    end

    context 'when params are valid' do
      let(:user) { create(:user) }
      let(:generic_item_user_params) do
        {
          generic_item_id: ''
        }
      end

      before do
        token = authenticate(user)
        post '/api/generic_item_users',
             params: { generic_item_user: generic_item_user_params },
             headers: { authorization: token }
      end

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response_body).to have_key('errors') }
      it { expect(GenericItemUser.count).to eq(0) }
      it { expect(response_body['errors']['generic_item']).to include('é obrigatório(a)') }
    end
  end
end
