class AddAttachmentImageToHeroes < ActiveRecord::Migration[5.1]
  def self.up
    change_table :heroes do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :heroes, :image
  end
end
