# frozen_string_literal: true

# camp model
class Camp < ApplicationRecord
  enum camp_type: { Virtual: 0, Physical: 1, Hybrid: 2 }

  def self.search(term)
    where(
      'lower(camps.camp_title) LIKE :value
      or lower(camps.locations) LIKE :value',
      value: "%#{term.downcase}%"
    )
  end
end
