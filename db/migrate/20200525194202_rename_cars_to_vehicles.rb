class RenameCarsToVehicles < ActiveRecord::Migration[6.0]
  def change
    rename_table :cars, :vehicles
  end
end
