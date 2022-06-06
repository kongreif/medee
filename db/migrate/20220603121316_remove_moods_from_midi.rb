class RemoveMoodsFromMidi < ActiveRecord::Migration[7.0]
  def change
    remove_column :midis, :moods
  end
end
