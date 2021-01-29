FactoryBot.define do
  factory :event_log do
    date { "2021-01-29 12:12:00" }
    reward_points { 0 }
    event { 'UserAuthenticated' }
    rewarded { false }
    user

  end
end
