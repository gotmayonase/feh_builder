class CPassive < Passive
  has_many :heroes, inverse_of: :c_passive
end
