# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'POST /api/users' do
    context 'when params are valid' do
      before do
        post '/api/users',
             params: { user: user_params }
      end

      let(:user_params) { attributes_for(:user) }

      it { expect(response).to have_http_status(:created) }
      it { expect(response_body).to have_key('id') }
      it { expect(response_body).to have_key('token') }
      it { expect(response_body['token']).not_to be_nil }
      it { expect(User.count).to eq(1) }
      it { expect(User.last.email).to eq(user_params[:email]) }
    end

    context 'when params are invalid' do
      before do
        post '/api/users',
             params: { user: user_params }
      end

      let(:user_params) { attributes_for(:user, email: '', password: '') }

      it { expect(response).to have_http_status(:unprocessable_entity) }
      it { expect(response_body).to have_key('errors') }
      it { expect(User.count).to eq(0) }
      it { expect(response_body['errors']['email']).to include('não pode ficar em branco') }
      it { expect(response_body['errors']['password']).to include('não pode ficar em branco') }
    end
  end
end
