class ProfilesController < ApplicationController
  def profile

    @midis = policy_scope(Midi.where(user_id: current_user))
  end
end
