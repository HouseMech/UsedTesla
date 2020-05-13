class AddSpecFieldsToCar < ActiveRecord::Migration[5.2]
  def change
    add_column :cars, :acceleration_time, :integer
    add_column :cars, :top_speed, :integer
    add_column :cars, :battery_range, :integer
  end
end
