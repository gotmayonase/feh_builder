class AddAttachmentImageToPassives < ActiveRecord::Migration[5.1]
  def self.up
    change_table :passives do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :passives, :image
  end
end
