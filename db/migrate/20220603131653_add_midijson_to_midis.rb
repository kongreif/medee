class AddMidijsonToMidis < ActiveRecord::Migration[7.0]
  def change
    add_column :midis, :midi_json, :jsonb
  end
end
