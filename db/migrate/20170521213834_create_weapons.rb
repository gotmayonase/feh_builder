class CreateWeapons < ActiveRecord::Migration[5.1]
  def change
    create_table :weapons do |t|
      t.string :name
      t.integer :sp_cost
      t.integer :damage
      t.integer :range
      t.text :effect
      t.boolean :exclusive

      t.timestamps
    end
  end
end
