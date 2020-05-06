require 'rails_helper'

RSpec.describe "Admin::Versions", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/admin/versions/index"
      expect(response).to have_http_status(:success)
    end
  end

end
