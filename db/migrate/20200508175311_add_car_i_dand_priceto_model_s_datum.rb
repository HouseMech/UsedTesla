class AddCarIDandPricetoModelSDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :model_s_data, :carID, :string
    add_column :model_s_data, :carPrice, :integer
  end
end
