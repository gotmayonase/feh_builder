class Special < ApplicationRecord
  has_many :heroes

  scope :assigned, -> { where("heroes_count > 0")}
end
