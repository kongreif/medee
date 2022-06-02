class ProfilesController < ApplicationController
  def profile
    @midis = policy_scope(Midi.where(user_id: current_user))
  end

  def edit
    # pundit authorization needed
  end

  # def edit_profile_photo

  # end

  def update
    current_user.update(profile_params)
    redirect_to edit_profiles_path
  end

  private

  def profile_params
    params.require(:user).permit(:photo)
  end
end
