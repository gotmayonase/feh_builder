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

  %i{weapon assist special a_passive b_passive c_passive}.each do |f|
    define_method f do
      f.to_s.classify.constantize.find(self.send("#{f}_id"))
    end
  end

  def hero
    @hero ||= Hero.find(self.hero_id)
  end

  def ranked_heroes
    ids = matching_hero_ids
    heroes = Hero.where(id: ids).with_includes
    heroes.each do |hero|
      hero.match_score = ids.count(hero.id)
    end
    heroes.sort_by(&:match_score).reverse
  end

  private

    def matching_hero_ids
      Hero.find_by_sql(full_query).map(&:id)
    end

    def sql_query_for_field(field, value)
      <<-SQL
      SELECT id
      FROM heroes
      WHERE #{field} = #{Hero.connection.quote(value)} AND id <> #{Hero.connection.quote(self.hero_id)}
      SQL
    end

    def full_query
      %i{weapon assist special a_passive b_passive c_passive}.map do |f|
        field = "#{f}_id"
        value = self.send(field)
        next if self.hero.send(field) == value.to_i || value.blank?
        sql_query_for_field(field, value)
      end.compact.join("\nUNION ALL\n")
    end

end
