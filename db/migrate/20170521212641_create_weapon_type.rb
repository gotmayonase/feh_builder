class CreateWeaponType < ActiveRecord::Migration[5.1]
  def change
    create_table :weapon_types do |t|
      t.string :name
    end
  end
end
