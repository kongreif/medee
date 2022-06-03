class Midi < ApplicationRecord
  serialize :midi, Array
  belongs_to :user
  validates :title, presence: true
  validates :key_signature, presence: true
  validates :time_signature, presence: true
  has_many :midi_moods, dependent: :destroy
  has_many :moods, through: :midi_moods
  has_many :midi_categories, dependent: :destroy
  has_many :categories, through: :midi_categories
  has_many :upvotes
  has_one_attached :midi_file
  has_many :comments
  
  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title], using: { tsearch: { prefix: true } }

  enum category: {
    lead: 1,
    chords: 2,
    pads: 3,
    bassline: 4,
    drums: 5,
    plucked: 6
  }
end
