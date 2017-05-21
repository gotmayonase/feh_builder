class CreateMovementType < ActiveRecord::Migration[5.1]
  def change
    create_table :movement_types do |t|
      t.string :name
    end
  end
end
