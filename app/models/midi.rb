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

  # TODO: implement against mood, category, ...
  # pg_search_scope :global_search,
  # against: [ :title, :synopsis ],
  # associated_against: {
  #   director: [ :first_name, :last_name ]
  # },
  # using: {
  #   tsearch: { prefix: true }
  # }
  # pg_search currently only against the title
  include PgSearch::Model
  pg_search_scope :search_by_title, against: [:title], using: { tsearch: { prefix: true } }
end
