require 'rails_helper'

RSpec.describe Reward, type: :model do
  # Associations
  it { should belong_to(:project) }
  it { should have_many(:users).through(:user_rewards) }

  # Validations
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:description) }
  it { should validate_presence_of(:lower_bound) }
  it { should validate_presence_of(:upper_bound) }
  it { should validate_numericality_of(:lower_bound) }
  it { should validate_numericality_of(:upper_bound) }
  it { should validate_inclusion_of(:dispatchable).in_array([true, false]) }
end
