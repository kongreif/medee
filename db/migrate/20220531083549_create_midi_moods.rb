class CreateMidiMoods < ActiveRecord::Migration[7.0]
  def change
    create_table :midi_moods do |t|
      t.references :mood, null: false, foreign_key: true
      t.references :midi, null: false, foreign_key: true

      t.timestamps
    end
  end
end
