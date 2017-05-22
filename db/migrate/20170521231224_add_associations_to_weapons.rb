class AddAssociationsToWeapons < ActiveRecord::Migration[5.1]
  def change
    add_reference :weapons, :weapon_type, foreign_key: true
    add_reference :weapons, :color, foreign_key: true
  end
end
