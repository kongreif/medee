class AddCategoryToMidis < ActiveRecord::Migration[7.0]
  def change
    add_column :midis, :category, :integer
  end
end
