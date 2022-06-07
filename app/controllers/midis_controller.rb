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

    json = JSON.parse(@midi.midi_json)
    @chart_data = []
    # @note_names = json["tracks"][0]["notes"].map { |note| note["name"] }

    json["tracks"][0]["notes"].each { |note| @chart_data << [note["time"], note["midi"]] }

    # @note_times = json["tracks"][0]["notes"].map { |note| note["time"] }

    # json["tracks"][0]["notes"].each do |note|
    # # note["name"] note["time"]
    # end

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
    params.require(:midi).permit(:title, :key_signature, :time_signature, :description, :midi_file, :midi_json, :category, mood_ids: [])
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
