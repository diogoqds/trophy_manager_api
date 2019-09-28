# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Session', type: :request do
  describe 'POST /api/session' do
    before do
      create(:user, email: 'teste@email.com', password: '123456')
      post '/api/session',
           params: { session: session_params }
    end

    context 'when params are valid' do
      let(:session_params) do
        {
          email: 'teste@email.com',
          password: '123456'
        }
      end

      it 'return http status 201' do
        expect(response).to have_http_status(:created)
      end

      it 'return token' do
        expect(response_body).to have_key('token')
      end

      it 'token is not nil' do
        expect(response_body['token']).to be_truthy
      end
    end

    context 'when params are invalid' do
      let(:session_params) do
        {
          email: 'teste@email.com',
          password: 'password_invalid'
        }
      end

      it 'return http status 401' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'return error' do
        expect(response_body).to have_key('error')
      end
      it { expect(response_body['message']).to include('inválidos') }
    end
  end
end
