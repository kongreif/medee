class CommentsController < ApplicationController
  # before_action :authenticate_user!
  def create
    @midi = Midi.find(params[:midi_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.midi = @midi
    if @comment.save
      redirect_to midi_path(@midi)
    else
      render "midis/show", status: :unprocessable_entity
    end
  end

  def show
    @comment = Comment.find(params[:id])
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
