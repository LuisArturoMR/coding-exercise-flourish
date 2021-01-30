FactoryBot.define do
  factory :user do
    email { Faker::Name.name  }
    points { 0 }
    balance { 0.0 }
  end
end
