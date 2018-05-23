FactoryBot.define do
  factory :bank_account do
    bank { Faker::Bank.name }
    account { Faker::Bank.iban }
    rut { Faker::Number.number(99) }
    type { Faker::Number.between(0, 1) }
  end
end
