class FixAccelerationTime < ActiveRecord::Migration[5.2]
  def change
    change_column :cars, :acceleration_time, :float
  end
end
