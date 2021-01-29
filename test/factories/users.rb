FactoryBot.define do
  factory :user do
    email { Faker::Name.name  }
    password { "xxx" }
    points { 0 }
    balance { 0.0 }
  end
end
