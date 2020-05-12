class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :carID
      t.string :carModel
      t.boolean :autopilot
      t.string :paint
      t.string :interiorDecor
      t.string :roof

      t.timestamps
    end
  end
end
