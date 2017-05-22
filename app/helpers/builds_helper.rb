module BuildsHelper

  def should_display_field?(build, field, hero)
    id_field = "#{field}_id"

    (build_val = build.send(id_field)) &&
      build.hero.send(id_field) != build_val.to_i &&
      build_val.to_i == hero.send(id_field)
  end

end
