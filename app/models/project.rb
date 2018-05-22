class Project < ApplicationRecord
  # Enums
  enum status: [:pending, :running, :finished, :archived], _suffix: true

  # Associations
  belongs_to :user
  has_many :comments
  has_many :news
  has_many :project_tags
  has_many :tags, through: :project_tags
  has_many :rewards
  has_many :donations

  # Validations
  validates :title, presence: true, uniqueness: { case_sensitive: false }
  validates :deadline, presence: true
  validates :description, presence: true
  validates :goal, presence: true
  validates :status, presence: true
end
