class ProfilePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def change_photo?
    true
  end

  def update_photo?
    true
  end

  def edit?
    true
  end

  def update?
    true
  end
end
