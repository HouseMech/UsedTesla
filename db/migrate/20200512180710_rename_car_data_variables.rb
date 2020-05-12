class RenameCarDataVariables < ActiveRecord::Migration[5.2]
  def change
    rename_column :model_three_data, :carID, :car_id
    rename_column :model_s_data, :carID, :car_id
    rename_column :model_x_data, :carID, :car_id

    rename_column :model_three_data, :carPrice, :car_price
    rename_column :model_s_data, :carPrice, :car_price
    rename_column :model_x_data, :carPrice, :car_price
  end
end
