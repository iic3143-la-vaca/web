FactoryBot.define do
  factory :reward do
    name { Faker::HarryPotter.book }
    description { Faker::HarryPotter.quote }
    lower_bound nil
    upper_bound nil
    dispatchable { Faker::Boolean.boolean }
    project nil
  end
end
