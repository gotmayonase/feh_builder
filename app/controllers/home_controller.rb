class HomeController < ApplicationController

  def index
    @heroes = Hero.with_includes.order('name asc')
  end

end
