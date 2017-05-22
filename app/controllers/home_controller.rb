class HomeController < ApplicationController

  def index
    @heroes = Hero.includes(:weapon_type,
                            :movement_type,
                            :color,
                            :weapon,
                            :assist,
                            :special,
                            :a_passive,
                            :b_passive,
                            :c_passive).order('name asc')
  end

end
