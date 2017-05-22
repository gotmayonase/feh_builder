class Passive < ApplicationRecord
  has_many :heroes
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
