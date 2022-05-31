class MidiCategory < ApplicationRecord
  validates :category, :category, presence: true
  belongs_to :category
  belongs_to :midi
end
