class CreateSpecials < ActiveRecord::Migration[5.1]
  def change
    create_table :specials do |t|
      t.string :name
      t.integer :sp_cost
      t.integer :cooldown
      t.text :effect
      t.string :inherit_restriction

      t.timestamps
    end
  end
end
