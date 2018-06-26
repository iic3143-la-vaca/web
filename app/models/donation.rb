class Donation < ApplicationRecord
  belongs_to :user
  belongs_to :project

  # Validations
  validates :amount, presence: true
end
