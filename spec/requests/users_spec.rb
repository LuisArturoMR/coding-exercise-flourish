require "rails_helper"
require "byebug"

RSpec.describe "User endpoints", type: :request do
  let!(:user) {create(:user, points: 700, balance: 60) }
  let!(:auth_headers) {{'Authorization' => "Bearer #{user.token_auth}"}}
  let!(:redeem_params_user) { { "name" => "Amazon Gift Card", "date" => Time.zone.now } }

  describe "POST /users/{user_id}/redeems" do
      before {post "/users/#{user.id}/redeems", params: redeem_params_user, headers: auth_headers}
    context "payload" do
      subject {JSON.parse(response.body)}
      it {is_expected.to include("action" => "redeem")}
      it {is_expected.to include("points_cost" => 500)}
    end
    context "response" do
      subject {response}
      it {is_expected.to have_http_status(:created)}
    end
  end
end