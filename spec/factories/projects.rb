FactoryBot.define do
  factory :project do
    title { Faker::Company.name }
    description { Faker::Company.catch_phrase }
    financing_description { Faker::Company.catch_phrase }
    creators_description { Faker::Company.catch_phrase }
    deadline Faker::Date.between(15.days.from_now, 60.days.from_now)
    goal { Faker::Number.number(7) }
    status { 0 }
    user { nil }

    after(:create) do |project, evaluator|
      create_list(:reward, 2, project: project)
    end
  end
end