class Assist < ApplicationRecord
  has_many :heroes

  validates :name, presence: true, uniqueness: true
end
