class RenameFields < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicle_data, :car_price, :price
    rename_column :vehicle_data, :date_acquired, :data_acquired
    rename_column :vehicles, :car_model, :model
  end
end
