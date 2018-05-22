require 'rails_helper'

RSpec.describe BankAccount, type: :model do
  # Enum test
  it { should define_enum_for(:type) }

  # Association test
  it { should belong_to(:user) }

  # Validation test 
  it { should validate_presence_of(:bank) }
  it { should validate_presence_of(:account) }
  it { should validate_presence_of(:rut) }
end
