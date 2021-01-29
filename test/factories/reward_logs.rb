FactoryBot.define do
  factory :reward_log do
    name { "Gift Card" }
    description { "Amazon Gift Card" }
    points_cost { 100 }
    date { "2021-01-29 12:05:15" }
    user
  end
end
