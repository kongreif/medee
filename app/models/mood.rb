class Mood < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_many :midi_moods
  has_many :midis, through: :midi_moods
end
