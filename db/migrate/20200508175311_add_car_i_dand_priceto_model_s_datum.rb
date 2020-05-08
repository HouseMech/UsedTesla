class AddCarIDandPricetoModelSDatum < ActiveRecord::Migration[5.2]
  def change
    add_column :model_sdata, :carID, :string
    add_column :model_sdata, :carPrice, :integer
  end
end
