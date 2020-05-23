class UpdateDateField < ActiveRecord::Migration[6.0]
  def change
    rename_column :car_data, :date, :date_acquired
    change_column :car_data, :date_acquired, :date
  end
end
