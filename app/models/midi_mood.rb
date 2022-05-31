class MidiMood < ApplicationRecord
  belongs_to :mood
  belongs_to :midi
end
