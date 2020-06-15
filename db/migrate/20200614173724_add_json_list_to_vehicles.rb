class AddJsonListToVehicles < ActiveRecord::Migration[6.0]
  def change
    add_column :vehicles, :option_code_list, :json
  end
end
