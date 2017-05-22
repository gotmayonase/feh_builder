class Assist < ApplicationRecord
  has_many :heroes

  validates :name, presence: true, uniqueness: true

  scope :assigned, -> { where("heroes_count > 0")}
end
