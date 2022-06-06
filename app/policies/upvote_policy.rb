class UpvotePolicy < ApplicationPolicy
  class Scope < Scope
  end

  def create?
    true
  end

  def destroy?
    true
  end
end
