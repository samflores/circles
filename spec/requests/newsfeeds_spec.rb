require 'rails_helper'

RSpec.describe "Newsfeeds", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/newsfeeds/index"
      expect(response).to have_http_status(:success)
    end
  end

end
