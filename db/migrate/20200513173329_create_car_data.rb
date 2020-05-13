class CreateCarData < ActiveRecord::Migration[5.2]
  def change
    create_table :car_data do |t|
      t.integer :car_price
      t.integer :car_id

      t.timestamps
    end
  end
end
