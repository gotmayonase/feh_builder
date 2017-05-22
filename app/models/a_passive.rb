class APassive < Passive
  has_many :heroes, inverse_of: :a_passive
end
