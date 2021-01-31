require "rails_helper"
require "byebug"

RSpec.describe "Events endpoints", type: :request do

  describe "POST /user_events" do
    let!(:user) {create(:user) }
    let!(:auth_headers) {{'Authorization' => "Bearer #{user.token_auth}"}}
    let!(:create_params_event) { { "date" => Time.zone.now, "event" => "UserAuthenticated"} }
    let!(:create_other_params_event) { { "date" => Time.zone.now()- 1.days, "event" => "UserAuthenticated"} }
    let!(:create_events) {create_list(:event_log, 5, user_id: user.id)}

    context "UserAuthenticated" do
      context "New day Logged" do
        before(:example) { post "/user_events", params: create_params_event, headers: auth_headers }

        context "payload" do
          subject {JSON.parse(response.body)}
          it { is_expected.to be_a(Object) }
          it { is_expected.to include("id" => 6)}
          it { is_expected.to include("reward_points" => 10)}
        end
      end
      context "New 7 day streak" do
        before(:example) { post "/user_events", params: create_other_params_event, headers: auth_headers }

        context "payload" do
          subject {JSON.parse(response.body)}
          it { is_expected.to be_a(Object) }
          it { is_expected.to include("id" => 6)}
          it { is_expected.to include("reward_points" => 10)}
        end
      end
    end
  end
end