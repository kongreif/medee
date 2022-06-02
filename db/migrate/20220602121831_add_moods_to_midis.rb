class AddMoodsToMidis < ActiveRecord::Migration[7.0]
  def change
    add_column :midis, :moods, :text, array: true, default: []
  end
end
