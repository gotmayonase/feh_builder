class Hero < ApplicationRecord
  belongs_to :weapon_type
  belongs_to :movement_type
  belongs_to :color
  belongs_to :weapon
  belongs_to :assist
  belongs_to :a_passive, class_name: 'Passive'
  belongs_to :b_passive, class_name: 'Passive'
  belongs_to :c_passive, class_name: 'Passive'
end
