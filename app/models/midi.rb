class Midi < ApplicationRecord
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

  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title], using: { tsearch: { prefix: true } }

  CATEGORIES = ['lead', 'chords', 'pads', 'bassline', 'drums', 'plucked']
  enum status: categories
end
