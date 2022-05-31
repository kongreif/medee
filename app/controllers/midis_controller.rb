class MidisController < ApplicationController
  def index
    @midis = Midi.all
  end
end
