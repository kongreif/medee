class CommentsController < ApplicationController
  # before_action :authenticate_user!
  def create
    @midi = Midi.find(params[:midi_id])
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user_id = current_user.id
    # @comment.user = current_user
    @comment.midi_id = @midi.id
    if @comment.save
      redirect_to midi_path(@midi)
    else
      @midi = Midi.find(params[:midi_id])
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
