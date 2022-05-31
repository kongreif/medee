class MidiCategory < ApplicationRecord
  validates :category, :midi, presence: true
  belongs_to :category
  belongs_to :midi
end
