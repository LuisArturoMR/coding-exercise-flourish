require "rails_helper"

RSpec.describe "Rewards endpoint", type: :request do

  describe "GET /rewards" do
    it "should return OK and be empty" do
      get '/rewards'
      payload = JSON.parse(response.body)
      expect(payload).to be_empty
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /rewards with data in the DB" do
    let!(:reward_logs) { create_list(:reward_log, 10) }

    it "should return all the rewards redeemed by the user" do
      get '/rewards'
      payload = JSON.parse(response.body)
      expect(payload.size).to eq(reward_logs.size)
      expect(response).to have_http_status(200)
    end
  end
end