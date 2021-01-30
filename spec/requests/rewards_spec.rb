require "rails_helper"
require "byebug"

RSpec.describe "Rewards endpoint", type: :request do
    let!(:user) { create(:user) }
    let!(:other_user) { create(:user) }
    let!(:reward_redeemed) { create(:reward_log, user_id: user.id) }
    let!(:other_reward_redeemed) { create(:reward_log, user_id: other_user.id) }
    let!(:auth_headers) {{'Authorization' => "Bearer #{user.token_auth}"}}
    let!(:other_auth_headers) {{'Authorization' => "Bearer #{other_user.token_auth}"}}
    let!(:reward_log) { create_list(:reward_log, 5,  user_id: user.id) }
    let!(:other_reward_log) { create_list(:reward_log, 2, user_id: other_user.id) }


    describe "GET /rewards" do
      context "with user authenticated" do
        before { get "/rewards", headers: auth_headers}

        context "payload" do
          subject {payload}
          #it {(is_expected).to eq 5}
        end
        context "response" do
          subject {response}
          it { is_expected.to have_http_status(:ok) }
        end
      end
      context "with user unauthorized" do
      end
    end

    private

    def payload
      if JSON.parse(response.body).instance_of? Object
        JSON.parse(response.body).with_indifferent_access
      end
      JSON.parse(response.body)
    end
end