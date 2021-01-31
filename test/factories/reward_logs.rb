FactoryBot.define do
  factory :reward_log do
    name { "Gift Card" }
    description { "Amazon Gift Card" }
    points_cost { 1000 }
    date Time.zone.now
    action { "redeem" }
    user
  end
  factory :reward_log_rewarded, parent: :reward_log do
    action { "obtain" }
    points_cost {100}
    name { "Checked your savings 7 days!" }
    description { "You rock! continue checking yours savings every day!" }
  end
end
