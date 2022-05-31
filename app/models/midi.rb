class Midi < ApplicationRecord
  belongs_to :user
  has_many :midi_moods
  has_many :moods, through: :midi_moods
  has_many :midi_categories
  has_many :moods, through: :midi_categories
  has_many :upvotes
end
