class MidisController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @midis = policy_scope(Midi)
  end

  def show
    # authorize @midis
  end

  def create
    raise
  end
end
