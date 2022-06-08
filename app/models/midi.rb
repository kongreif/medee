class Midi < ApplicationRecord
  serialize :midi, Array

  has_many :midi_moods, dependent: :destroy
  has_many :moods, through: :midi_moods
  has_many :upvotes, dependent: :destroy
  has_one_attached :midi_file
  has_many :comments
  belongs_to :user

  validates :title, presence: true
  validates :key_signature, presence: true
  validates :time_signature, presence: true
  validates :midi_file, attached: true, size: { less_than: 5.kilobytes, message: 'is too large' }

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

  enum key_signature: {
    Cmajor: 1,
    Gmajor: 2,
    Dmajor: 3,
    Amajor: 4,
    Emajor: 5,
    Bmajor: 6,
    Fsharpmajor: 7,
    Dflatmajor: 8,
    Aflatmajor: 9,
    Eflatmajor: 10,
    Bflatmajor: 11,
    Fmajor: 12,
    Aminor: 13,
    Eminor: 14,
    Bminor: 15,
    Fsharpminor: 16,
    Csharpminor: 17,
    Gsharpminor: 18,
    Dsharpminor: 19,
    Bflatminor: 20,
    Fminor: 21,
    Cminor: 22,
    Gminor: 23,
    Dminor: 24
  }
end
