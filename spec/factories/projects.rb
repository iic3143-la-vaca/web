FactoryBot.define do
  factory :project do
    title 
    description "MyText"
    deadline "2018-05-21"
    goal 1.5
    
    after(:create) do |project, evaluator|
      create_list(:reward, 2, project: project)
    end
  end
end
