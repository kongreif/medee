class ProfilesController < ApplicationController
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
