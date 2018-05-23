FactoryBot.define do
  factory :reward do
    name { Faker::HarryPotter.quote }
    description { Faker::HarryPotter.book }
    lower_bound { Faker::Number.decimal(1, 2) }
    upper_bound { Faker::Number.decimal(2, 2) }
    dispatchable { Faker::Boolean.boolean }
  end
end
