class AddTireFieldToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :tires, :string
  end
end
