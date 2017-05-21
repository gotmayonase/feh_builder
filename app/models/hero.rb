class Hero < ApplicationRecord
  belongs_to :weapon_type
  belongs_to :movement_type
  belongs_to :color
  belongs_to :weapon, optional: true
  belongs_to :assist, optional: true
  belongs_to :a_passive, class_name: 'Passive', optional: true
  belongs_to :b_passive, class_name: 'Passive', optional: true
  belongs_to :c_passive, class_name: 'Passive', optional: true

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
