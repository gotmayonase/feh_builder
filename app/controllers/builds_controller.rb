class BuildsController < ApplicationController

  before_action :set_hero

  def new
    @build = Build.new
  end

  private

    def set_hero
      @hero = Hero.find_by(name: params[:hero_id])
    end

end
