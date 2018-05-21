require 'rails_helper'

RSpec.describe User, type: :model do
  # Enum test
  it { should define_enum_for(:role) }

  # Association test
  it { should have_many(:control_users) }
  it { should have_many(:bulges) }
  it { should have_many(:scraps) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:rut) }
  it { should validate_presence_of(:dv) }
  it { should validate_presence_of(:role) }
  it { should validate_uniqueness_of(:rut) }
end
