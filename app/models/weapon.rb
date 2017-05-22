class Weapon < ApplicationRecord
  has_many :heroes
  belongs_to :weapon_type
  belongs_to :color
end
