class BankAccount < ApplicationRecord
  # Enums
  enum account_type: [:checking, :current], _suffix: true

  # Associations
  belongs_to :user

  # Validations
  validates :bank, presence: true
  validates :account, presence: true
  validates :rut, presence: true
end
