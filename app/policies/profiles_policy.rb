class ProfilesPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end

  def edit?
    true
  end

  # def edit_profile_photo
  #   true
  # end
end
