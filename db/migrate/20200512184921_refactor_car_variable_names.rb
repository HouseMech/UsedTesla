class RefactorCarVariableNames < ActiveRecord::Migration[5.2]
  def change
    rename_column :cars, :carID, :car_id
    rename_column :cars, :carModel, :car_model
    rename_column :cars, :interiorDecor, :interior_decor
  end
end
