# frozen_string_literal: true

# this is application policy
class ApplicationPolicy
  attr_reader :user, :model

  def initialize(user, model)
    @user = user
    @model = model
  end

  def index?
    true
  end

  def show?
    true
  end

  def create?
    true
  end

  def new?
    true
  end

  def update?
    true
  end

  def edit?
    true
  end

  def destroy?
    true
  end
end
