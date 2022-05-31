class MidisController < ApplicationController
  def index
    @midis = Midi.all
  end

  def show
  end
end
