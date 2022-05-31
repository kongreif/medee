class MidisController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @midis = policy_scope(Midi)
    @midis = Midi.search_by_title(params[:query]) if params[:query].present?
  end

  def show
    # authorize @midis
  end
end
