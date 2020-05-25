class RenameCarIdToVin < ActiveRecord::Migration[6.0]
  def change
    rename_column :cars, :car_id, :vin
  end
end
