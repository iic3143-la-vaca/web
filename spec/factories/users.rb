FactoryBot.define do
  factory :user do
    name { Faker::Name.first_name }
    email { Faker::Internet.email }
    role { 1 }
    password { Faker::Number.number(8) }
  end
end
