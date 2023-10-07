require 'rails_helper'

RSpec.describe "HealthChecks", type: :request do
  describe 'GET /show' do
    context 'when everything is ok' do
      it 'returns http success' do
        get '/alive'
        expect(response).to have_http_status(:ok)
      end
    end

    context 'when something is wrong' do
      before do
        allow_any_instance_of(HealthChecksController).to receive(:show).and_raise(StandardError)
      end

      it 'returns http internal server error' do
        get '/alive'
        expect(response).to have_http_status(:internal_server_error)
      end
    end
  end
end
