class Reward < ApplicationRecord
  # Associations
  belongs_to :project
  has_many :user_rewards
  has_many :users, through: :user_rewards

  # Validations
  validates :title, presence: true
  validates :description, presence: true
  validates :lower_bound, presence: true, numericality: true
  validates :upper_bound, presence: true, numericality: true
  validates :dispatchable, presence: true
end
