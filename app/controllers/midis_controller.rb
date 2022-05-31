class MidisController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @midis = Midi.all
    # authorize @midis
  end

  def show
    authorize @midi
  end
end
