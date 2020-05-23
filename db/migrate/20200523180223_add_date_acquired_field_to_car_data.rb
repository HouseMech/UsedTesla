class AddDateAcquiredFieldToCarData < ActiveRecord::Migration[6.0]
  def change
    add_column :car_data, :date, :datetime
  end
end
