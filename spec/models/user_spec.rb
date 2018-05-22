require 'rails_helper'

RSpec.describe User, type: :model do
  # Enum test
  it { should define_enum_for(:role) }

  # Association test
  it { should have_many(:rewards).through(:user_rewards) }
  it { should have_many(:bank_accounts) }
  it { should have_many(:comments) }
  it { should have_many(:news) }
  it { should have_many(:projects) }
  it { should have_many(:donations) }
  it { should have_many(:addresses) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_uniqueness_of(:email).case_insensitive }
  it { should validate_presence_of(:role) }
end
