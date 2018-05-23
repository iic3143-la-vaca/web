FactoryBot.define do
  factory :project do
    title { Faker::Company.unique.name  }
    description { Faker::Company.catch_phrase }
    financing_description { Faker::HarryPotter.quote }
    creators_description { Faker::StarWars.quote }
    deadline Faker::Date.between(15.days.from_now, 60.days.from_now)
    goal { Faker::Number.number(7) }
    status { 0 }
    user { nil }
    after(:create) do |project|
      lower1 = Faker::Number.number(1).to_i
      upper1 = Faker::Number.number(2).to_i
      lower2 = upper1 + 1
      upper2 = lower2 + Faker::Number.number(2).to_i
      lower3 = upper2 + 1
      upper3 = lower3 + Faker::Number.number(2).to_i
      bounds = [[lower1, upper1], [lower2, upper2], [lower3, upper3]]
      bounds.map { |b| create(:reward, project: project, lower_bound: b[0], upper_bound: b[1]) }
    end
  end
end
