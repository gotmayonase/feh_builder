class CreateHeroes < ActiveRecord::Migration[5.1]
  def change
    create_table :heroes do |t|
      t.string :name
      t.string :title
      t.belongs_to :weapon_type, foreign_key: true
      t.belongs_to :movement_type, foreign_key: true
      t.belongs_to :color, foreign_key: true
      t.belongs_to :weapon, foreign_key: true
      t.belongs_to :assist, foreign_key: true
      t.belongs_to :special, foreign_key: true
      t.belongs_to :a_passive
      t.belongs_to :b_passive
      t.belongs_to :c_passive
    end
  end
end
