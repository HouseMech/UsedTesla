class AddVehicleHistory < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :vehicle_history, :string
  end
end
