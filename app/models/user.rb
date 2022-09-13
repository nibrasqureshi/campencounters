# frozen_string_literal:true

# User model
class User < ApplicationRecord
  has_one_attached :avatar
  paginates_per 5
  attribute :agreement, :integer

  validates :agreement, acceptance: { accept: 1 }
  # Include default devise modules. Others available are:
  #   :invitable :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  scope :simple_users, -> { where(type: nil) }

  validates :password, presence: true, confirmation: { case_sensitive: true },
                       format: { with: /\A(?=.*\d)(?=.*([A-Z]))([\x20-\x7E]|[^\x00-\x7F]){6,100}\z/ }

  # validates :first_name, presence: true
  # validates :last_name, presence: true

  def self.search(term)
    where(
      'lower(users.type) LIKE :value
       or users.phone LIKE :value or
       lower(users.country) LIKE :value or
       lower(users.first_name) LIKE :value or
       lower(users.email) LIKE :value ', value: "%#{term.downcase}%"
    )
  end
end
