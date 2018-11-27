require 'rails_helper'

RSpec.describe PlayersController, type: :controller do

  describe "GET #teams" do
    it "returns http success" do
      get :teams
      expect(response).to have_http_status(:success)
    end
  end

end
