class UserReward < ApplicationRecord
  belongs_to :user
  belongs_to :reward
end
