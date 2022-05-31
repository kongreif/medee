class CreateMidiCategories < ActiveRecord::Migration[7.0]
  def change
    create_table :midi_categories do |t|
      t.references :category, null: false, foreign_key: true
      t.references :midi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
