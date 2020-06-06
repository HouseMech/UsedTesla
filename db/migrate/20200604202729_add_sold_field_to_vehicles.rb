class AddSoldFieldToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :sold, :boolean
  end
end
