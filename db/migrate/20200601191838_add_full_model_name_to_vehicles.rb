class AddFullModelNameToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :full_model_name, :string
    add_column :vehicles, :trim_name, :string
  end
end
