class ProfilesController < ApplicationController
  def profile
    @midis = policy_scope(Midi.where(user_id: current_user))
  end

  def show
    @profile = Profile.find(params[:id])
    @user = @profile.user
    @midis = @user.midis
    @soundcloud = @profile.soundcloud_link
    @instagram = @profile.instagram_link
    @facebook = @profile.facebook_link
    # raise
  end

  def change_photo
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update_photo
    @profile = current_user.profile
    authorize @profile
    current_user.update(user_params)
    redirect_to profile_path(@profile)
  end

  def edit
    @profile = Profile.find(params[:id])
    authorize @profile
  end

  def update
    @profile = Profile.find(params[:id])
    authorize @profile
    @profile.update(profile_params)
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:photo)
  end

  def profile_params
    params.require(:profile).permit(:bio_description, :soundcloud_link, :instagram_link, :facebook_link)
  end
end
