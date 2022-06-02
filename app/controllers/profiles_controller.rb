class ProfilesController < ApplicationController
  def profile
    @midis = policy_scope(Midi.where(user_id: current_user))
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def edit

  end

  def update
    current_user.update(profile_params)
    redirect_to edit_profiles_path
  end

  private

  def profile_params
    params.require(:user).permit(:photo)
  end
end
