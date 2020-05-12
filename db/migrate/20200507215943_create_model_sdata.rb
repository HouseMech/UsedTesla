class CreateModelSdata < ActiveRecord::Migration[5.2]
  def change
    create_table :model_s_data do |t|

      t.timestamps
    end
  end
end
