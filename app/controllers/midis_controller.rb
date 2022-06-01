class MidisController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @midis = policy_scope(Midi)

    #  required for search
    @midis = Midi.search_by_title(params[:query]) if params[:query].present?

    # formatting the AJAX http
    # unobstrusive Java Script
    respond_to do |format|
      format.html # do the normal thing, render whole page
      format.text {
        render(
          partial: "midi_list",
          locals: { midis: @midis },
          formats: :html
        )
      }
    end
  end

  def show
    # authorize @midis
  end

  def create
    @midi = Midi.new(midi_params)
    @midi.user = current_user
    @midi.save
    raise
  end

  def midi_params
    params.require(:midi).permit(:title, :key_signature, :time_signature, :description)
  end
end
