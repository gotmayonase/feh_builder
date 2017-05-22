class BPassive < Passive
  has_many :heroes, inverse_of: :b_passive
end
