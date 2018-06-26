class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  # Assign default role
  after_initialize :default_role

  def default_role
    self.role = :normal
  end

  # Enum
  enum role: [:admin, :normal], _suffix: true

  # Associations
  has_many :user_rewards
  has_many :rewards, through: :user_rewards
  has_many :user_rewards
  has_many :bank_accounts
  has_many :comments
  has_many :news
  has_many :projects
  has_many :donations
  has_many :addresses

  # Validations
  validates :name, presence: true
  validates :role, presence: true
  validates :email, presence: true,
      format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
      uniqueness: { case_sensitive: false }

  # attr_reader :projects
  scope :accepted_projects,  ->  { 'hola' }
end
