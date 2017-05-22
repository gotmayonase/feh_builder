class Passive < ApplicationRecord
  self.inheritance_column = :slot
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :assigned, -> { where("heroes_count > 0")}
end
