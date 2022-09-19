# frozen_string_literal: true

# this is Admin policy
class AdminPolicy < ApplicationPolicy
  def index?
    admin_user?
  end

  def new?
    admin_user?
  end

  def create?
    new?
  end

  def edit?
    admin_user?
  end

  def update?
    admin_user? && user.id == post.id
  end

  def update_status?
   admin_user? 
  end

  def destroy?
    admin_user? 
  end

  private

  def admin_user?
    user.is_a?(Admin)
  end

  def post
    model
  end

end
