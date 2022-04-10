require 'rails_helper'

RSpec.describe 'Inquiries', type: :request do
  describe 'GET /new' do
    it 'returns http success' do
      get '/inquiry/new'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'POST /complete' do
    it 'returns http 302' do
      post inquiry_path, params: {
        inquiry: {
          name:    '山田太郎',
          email:   'test@example.com',
          type:    'system',
          content: <<~MSG
            システムの不具合のお問い合わせです。
            すごく良いシステムです。
          MSG
        }
      }
      expect(response).to have_http_status(:found)
    end

    context '不正な入力値の場合' do
      it 'returns http unprocessable_entity' do
        post inquiry_path, params: {
          inquiry: {
            email:   'test@example.com',
            type:    'system',
            content: <<~MSG
              システムの不具合のお問い合わせです。
              すごく良いシステムです。
            MSG
          }
        }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
