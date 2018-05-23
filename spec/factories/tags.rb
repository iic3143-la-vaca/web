tags = ['Energy', 'Recycle', 'CO2', 'Trees', 'Green']
color = []

FactoryBot.define do
  factory :tag do
    tag tags.sample
    color 'gray'
  end
end
