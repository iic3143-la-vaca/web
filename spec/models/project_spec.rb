require 'rails_helper'

RSpec.describe Project, type: :model do
  # Enum tests
  it { should define_enum_for(:status) }

  # Association tests
  it { should belong_to(:user) }
  it { should have_many(:comments) }
  it { should have_many(:news) }
  it { should have_many(:tags).through(:project_tags) }
  it { should have_many(:rewards) }
  it { should have_many(:donations) }

  # Validation tests
  it { should validate_uniqueness_of(:title).case_insensitive }
  it { should validate_presence_of(:deadline) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:goal) }
  it { should validate_presence_of(:status) }
end
