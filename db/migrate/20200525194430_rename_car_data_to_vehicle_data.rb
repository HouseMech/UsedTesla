class RenameCarDataToVehicleData < ActiveRecord::Migration[6.0]
  def change
    rename_table :car_data, :vehicle_data
  end
end
