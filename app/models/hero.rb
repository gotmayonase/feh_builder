class Hero < ApplicationRecord
  belongs_to :weapon_type
  belongs_to :movement_type
  belongs_to :color
  belongs_to :weapon, optional: true, counter_cache: true
  belongs_to :assist, optional: true, counter_cache: true
  belongs_to :special, optional: true, counter_cache: true
  belongs_to :a_passive, optional: true, counter_cache: true, inverse_of: :heroes
  belongs_to :b_passive, optional: true, counter_cache: true, inverse_of: :heroes
  belongs_to :c_passive, optional: true, counter_cache: true, inverse_of: :heroes

  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  attr_accessor :match_score

  def to_param
    name
  end
end
