require 'rails_helper'

RSpec.describe "Inquiries", type: :request do
  describe "GET /new" do
    it "returns http success" do
      get "/inquiries/new"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /complete" do
    it "returns http success" do
      get "/inquiries/complete"
      expect(response).to have_http_status(:success)
    end
  end

end
