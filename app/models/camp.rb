# frozen_string_literal: true

# camp model
class Camp < ApplicationRecord
  paginates_per 5

  has_many :users, dependent: :destroy
  belongs_to :admin, class_name: "User"

  enum camp_type: { Virtual: 0, Physical: 1, Hybrid: 2 }
  enum status: { in_active: 0, active: 1 }

  def self.search(term)
    where(
      'lower(camps.camp_title) LIKE :value
      or lower(camps.locations) LIKE :value',
      value: "%#{term.downcase}%"
    )
  end
end
# add_reference :camps, :user, null: true, foreign_key: true