# frozen_string_literal: true

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
    edit?
  end

  def destroy?
    admin_user?
  end

  private

  def admin_user?
    user.is_a?(Admin)
  end
end
