class Build
  include ActiveModel::Model

  attr_accessor :weapon_id, :assist_id, :special_id, :a_passive_id,
                :b_passive_id, :c_passive_id, :hero_id

  def initialize(attributes={})
    attributes.each do |key, val|
      self.send("#{key}=", val)
    end
  end

  def id
    Base64.encode64([hero_id, weapon_id, assist_id, special_id, a_passive_id, b_passive_id, c_passive_id].join('-'))
  end

  def self.find(str)
    ids = Base64.decode64(str).split('-')
    self.new(
      hero_id: ids[0],
      weapon_id: ids[1],
      assist_id: ids[2],
      special_id: ids[3],
      a_passive_id: ids[4],
      b_passive_id: ids[5],
      c_passive_id: ids[6]
    )
  end

  %i{weapon assist special a_passive b_passive c_passive hero}.each do |f|
    define_method f do
      f.to_s.classify.constantize.find(self.send("#{f}_id"))
    end
  end

  def ranked_heroes
    heroes = []
    %w{weapon_id assist_id special_id a_passive_id b_passive_id c_passive_id}.each do |field|
      unless (value = self.send(field)).blank?
        next if self.hero.send(field) == value.to_i
        matching = Hero.where("#{field} = ?", value)
        matching.each do |match|
          if i = heroes.index(match)
            heroes[i].match_score += 1
          else
            match.match_score = 1
            heroes << match
          end
        end
      end
    end
    heroes.sort_by(&:match_score).reverse
  end

end
