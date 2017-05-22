class Passive < ApplicationRecord
  self.inheritance_column = :slot

  scope :assigned, -> { where("heroes_count > 0")}
end
