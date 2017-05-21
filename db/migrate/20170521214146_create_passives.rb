class CreatePassives < ActiveRecord::Migration[5.1]
  def change
    create_table :passives do |t|
      t.string :slot
      t.string :name
      t.integer :sp_cost
      t.text :effect
      t.string :inherit_restriction

      t.timestamps
    end
  end
end
