require 'rails_helper'

RSpec.describe User, type: :model do
  # Enum test
  # it { should define_enum_for(:role) }

  # Association test
  it { should have_many(:rewards).through(:user_rewards) }
  # it { should have_many(:) }
  # it { should have_many(:scraps) }
  #
  # # Validation tests
  it { should validate_presence_of(:name) }
  # it { should validate_uniqueness_of(:rut) }
end
