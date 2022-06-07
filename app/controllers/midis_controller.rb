class MidisController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @midis = policy_scope(Midi)

    # required for search
    @midis = Midi.search_by_title(params[:query]) if params[:query].present?
    dynamic_search_response("midi_card_list", @midis)
  end

  def show
    @midi = Midi.find(params[:id])
    @comment = Comment.new
    authorize @midi

    # Charting / Plotting START
    # -------------------------------------------------------------------------------------
    json = JSON.parse(@midi.midi_json)
    @chart_data = []
    arr_notes = json["tracks"][0]["notes"]
    arr_notes.each { |note| @chart_data << [note["time"], note["midi"]] }
    # find the lowest note
    lowest_note = 127
    arr_notes.each do |note|
      lowest_note = note["midi"] if note["midi"] < lowest_note
    end
    # find the highest note
    highest_note = 1
    arr_notes.each do |note|
      highest_note = note["midi"] if note["midi"] > highest_note
    end
    # adjusted y-axis spectrum based on hightes/lowest note
    @bottom = lowest_note - 5
    @bottom = 0 if @bottom.negative?
    @top = highest_note + 5
    # -------------------------------------------------------------------------------------
    # Charting / Plotting END
  end

  def new
    @midi = Midi.new
  end

  def create
    @midi = Midi.new(midi_params)
    authorize @midi
    @midi.user = current_user
    if @midi.save
      redirect_to midi_path(@midi)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @midi = Midi.find(params[:id])
  end

  def update
    @midi = Midi.find(params[:id])
    @midi.update(midi_params)
    if @midi.save
      redirect_to midi_path(@midi)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @midi = Midi.find(params[:id])
    authorize @midi
    @midi.destroy
    redirect_to midis_path, status: :see_other
  end

  private

  def midi_params
    params.require(:midi).permit(:title, :key_signature, :time_signature, :description, :midi_file, :midi_json, :bpm, :category, mood_ids: [])
  end

  def dynamic_search_response(str_partial, query_data)
    raise "str_partial parameter needs to be a string" if str_partial.class != String

    respond_to do |format|
      format.html # do the normal thing, render whole page
      format.text {
        render(partial: str_partial, locals: { midis: query_data }, formats: :html)
      }
    end
  end
end
