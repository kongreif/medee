class MidiCategory < ApplicationRecord
  belongs_to :category
  belongs_to :midi
end
