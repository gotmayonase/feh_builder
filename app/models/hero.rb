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

  scope :with_includes, -> {
    includes(:weapon_type,
      :movement_type,
      :color,
      :weapon,
      :assist,
      :special,
      :a_passive,
      :b_passive,
      :c_passive
    )
  }

  attr_accessor :match_score

  def to_param
    name
  end
end
