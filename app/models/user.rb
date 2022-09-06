# frozen_string_literal:true

# User model
class User < ApplicationRecord
  attribute :agreement, :integer

  validates :agreement, acceptance: { accept: 1 }
  # Include default devise modules. Others available are:
  #   :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable

  scope :simple_users, -> { where(type: nil)}
end
