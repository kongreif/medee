class Category < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3 }
  has_many :midi_categories
  has_many :midis, through: :midi_categories
end
