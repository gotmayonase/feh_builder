class BuildsController < ApplicationController

  before_action :set_hero

  def new
    @build = Build.new(hero_id: @hero.id)
  end

  def create
    @build = Build.new(build_params)
    redirect_to hero_build_path(@hero, @build.id)
  end

  def show
    @build = Build.find(params[:id])
    @heroes = @build.ranked_heroes
  end

  private

    def set_hero
      @hero = Hero.find_by(name: params[:hero_id])
    end

    def build_params
      params.require(:build).permit!
    end

end
