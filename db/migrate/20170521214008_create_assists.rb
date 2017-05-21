class CreateAssists < ActiveRecord::Migration[5.1]
  def change
    create_table :assists do |t|
      t.string :name
      t.integer :sp_cost
      t.integer :range
      t.text :effect
      t.string :inherit_restriction

      t.timestamps
    end
  end
end
