class AddCounterCaches < ActiveRecord::Migration[5.1]
  def change
    add_column :weapons, :heroes_count, :integer
    add_column :assists, :heroes_count, :integer
    add_column :specials, :heroes_count, :integer
    add_column :passives, :heroes_count, :integer
  end
end
