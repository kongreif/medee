class AddChartdataToMidis < ActiveRecord::Migration[7.0]
  def change
    add_column :midis, :chart_data, :jsonb
  end
end
