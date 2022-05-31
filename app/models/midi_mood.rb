class MidiMood < ApplicationRecord
  validates :mood, :midi, presence: true
  belongs_to :mood
  belongs_to :midi
end
