class CreateCustomers < ActiveRecord::Migration[5.0]
  def change
    create_table :customers do |t|
      t.date :date
      t.string :machine
      t.string :game
      t.string :age
      t.string :gender
      t.string :race
      t.string :income
      t.string :group_type
      t.integer :group_size

      t.timestamps
    end
  end
end
