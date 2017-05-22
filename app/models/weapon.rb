class Weapon < ApplicationRecord
  has_many :heroes
  belongs_to :weapon_type
  belongs_to :color

  scope :assigned, -> { where("heroes_count > 0")}
end
