class BankAccount < ApplicationRecord
  # Enums
  enum type: [:checking, :current], _suffix: true

  # Associations
  belongs_to :user

  # Validations
  validates :bank, presence: true
  validates :account, presence: true
  validates :rut, presence: true
end
