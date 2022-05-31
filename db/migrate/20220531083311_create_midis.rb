class CreateMidis < ActiveRecord::Migration[7.0]
  def change
    create_table :midis do |t|
      t.string :title
      t.integer :download_count, default: 0
      t.integer :key_signature
      t.string :time_signature
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
