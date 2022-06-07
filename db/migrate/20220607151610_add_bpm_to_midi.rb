class AddBpmToMidi < ActiveRecord::Migration[7.0]
  def change
    add_column :midis, :bpm, :integer
  end
end
