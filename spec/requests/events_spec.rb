require "rails_helper"
require "byebug"

RSpec.describe "Events endpoints", type: :request do

  describe "POST /user_events" do
    let!(:user) {create(:user) }

    it "should create a new event, type: UserAuthenticated" do
      req_payload = {
        event: {
          event: "UserAuthenticated",
          user_id: user.id,
          date: DateTime.now,
          rewarded: false,
          reward_points: 0,
        }
      }
      post '/user_events', params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["id"]).to_not be_nil
      expect(payload["date"]).to_not be_nil
      expect(payload["reward_points"]).to_not be_nil
      expect(payload["event"]).to_not be_nil
      expect(payload["rewarded"]).to_not be_nil
      expect(response).to have_http_status(:created)
      end

    it "should return message on invalid event" do
      req_payload = {
        event: {
          type: 'UserAuthenticated',
          user_id: 0,
          date: DateTime.now,
          reward_points: 0,
          rewarded: false,
        }
      }
      post '/user_events', params: req_payload
      payload = JSON.parse(response.body)
      expect(payload).to_not be_empty
      expect(payload["error"]).to_not be_empty
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end
end