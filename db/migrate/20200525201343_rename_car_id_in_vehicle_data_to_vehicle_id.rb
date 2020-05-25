class RenameCarIdInVehicleDataToVehicleId < ActiveRecord::Migration[6.0]
  def change
    rename_column :vehicle_data, :car_id, :vehicle_id
  end
end
