class CreateModel3Data < ActiveRecord::Migration[5.2]
  def change
    create_table :model_three_data do |t|
      t.string :carID
      t.integer :carPrice

      t.timestamps
    end
  end
end
