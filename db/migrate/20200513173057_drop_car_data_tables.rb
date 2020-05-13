class DropCarDataTables < ActiveRecord::Migration[5.2]
  def change
    drop_table :model_s_data
    drop_table :model_x_data
    drop_table :model_three_data
  end
end
