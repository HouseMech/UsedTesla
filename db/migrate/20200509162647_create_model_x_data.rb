class CreateModelXData < ActiveRecord::Migration[5.2]
  def change
    create_table :model_x_data do |t|
      t.string :carID
      t.integer :carPrice

      t.timestamps
    end
  end
end
