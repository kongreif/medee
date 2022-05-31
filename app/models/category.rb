class Category < ApplicationRecord
  has_many :midi_categories
  has_many :midis, through: :midi_categories
end
