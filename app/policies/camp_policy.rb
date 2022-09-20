# frozen_string_literal: true

# this is camp policy
class CampPolicy < AdminPolicy
  def join_camp?
    user.camp.present?
  end
end

# policy(:camp).join_camp?
