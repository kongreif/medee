class UpvotesController < ApplicationController
  def create
    @upvote = Upvote.new(user: current_user, midi_id: params[:midi_id])
    authorize @upvote
    if @upvote.save
      redirect_back(fallback_location: midis_path)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @upvote = Upvote.find(params[:id])
    authorize @upvote
    @upvote.destroy
    redirect_back(fallback_location: midis_path)
  end

  private

  def upvote_params
    params.require(:upvote).permit(:user, :midi, :id)
  end
end
