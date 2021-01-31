require "rails_helper"
require "byebug"

RSpec.describe "Events endpoints", type: :request do
  let!(:user) {create(:user) }
  let!(:auth_headers) {{'Authorization' => "Bearer #{user.token_auth}"}}
  let!(:create_params_event) { { "date" => Time.zone.now, "event" => "UserAuthenticated"} }
  let!(:create_other_params_event) { { "date" => Time.zone.now()- 1.days, "event" => "IncorrectEvent"} }
  let!(:user_paid_bill_headers) { { "date" => Time.zone.now()- 1.days, "event" => "UserPaidBill", "paid" => 25} }
  let!(:other_user_paid_bill_headers) { { "date" => Time.zone.now()- 1.days, "event" => "UserPaidBill", "paid" => 220} }
  let!(:create_events) {create_list(:event_log, 5, user_id: user.id)}

  describe "POST /user_events" do

    context "UserAuthenticated" do
      context "New day Logged" do
        before { post "/user_events", params: create_params_event, headers: auth_headers }

        context "payload" do
          subject {JSON.parse(response.body)}
          it { is_expected.to be_a(Object) }
          it { is_expected.to include("id" => 6)}
          it { is_expected.to include("reward_points" => 10)}
        end

        context "response" do
          subject { response }
          it {is_expected.to have_http_status(:created)}
        end

        context "Event has to create a new reward" do
          before { get "/rewards", headers: auth_headers}

          context "payload" do
            subject {payload}
            it { is_expected.to be_a(Object) }
            it "get 1 rewards" do
              expect(payload.size).to be(1)
            end

          end
          context "response" do
            subject {response}
            it { is_expected.to have_http_status(:ok) }
          end
        end
      end

      context "New 7 day streak" do #toDo: Fix the test
        before { post "/user_events", params: create_params_event, headers: auth_headers }

        context "payload" do
          subject {JSON.parse(response.body)}
          it { is_expected.to be_a(Object) }
          it { is_expected.to include("id" => 6)}
          it { is_expected.to include("reward_points" => 10)}
        end
        context "response" do
          subject { response }
          it {is_expected.to have_http_status(:created)}
        end
      end
    end

    context "UserPaidBill" do
      before { post "/user_events", params: user_paid_bill_headers, headers: auth_headers }

      context "Paid 20"do
        context "payload" do
          subject {JSON.parse(response.body)}
          it { is_expected.to be_a(Object) }
          it { is_expected.to include("id" => 6)}
          it { is_expected.to include("event" => "UserPaidBill")}
          it { is_expected.to include("reward_points" => 0)}

        end
        context "response" do
          subject { response }
          it {is_expected.to have_http_status(:created)}
        end
      end


      context "Paid 220" do
      before { post "/user_events", params: other_user_paid_bill_headers, headers: auth_headers }
      context "payload" do
        subject {JSON.parse(response.body)}
        it { is_expected.to be_a(Object) }
        it { is_expected.to include("id" => 7)}
        it { is_expected.to include("event" => "UserPaidBill")}
        it { is_expected.to include("reward_points" => 40)}

      end
      context "response" do
        subject { response }
        it {is_expected.to have_http_status(:created)}
      end
      end


    end

    context "With invalid event" do
      before { post "/user_events", params: create_other_params_event, headers: auth_headers }

      context "payload" do
        subject {JSON.parse(response.body)}
        it { is_expected.to be_a(Object) }
        it { is_expected.to include("error")}
      end
      context "response" do
        subject { response }
        it {is_expected.to have_http_status(:not_found)}
      end
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