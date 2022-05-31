class Mood < ApplicationRecord
  has_many :midi_moods
  has_many :midis, through: :midi_moods
end
