class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @midi = Midi.new
    @profiles = policy_scope(Profile.all)
  end
end
