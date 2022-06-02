class RemoveMidiCategoriesAndCategoriesTable < ActiveRecord::Migration[7.0]
  def change
    drop_table :midi_categories
    drop_table :categories
  end
end
