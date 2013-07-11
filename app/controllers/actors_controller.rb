class ActorsController < ApplicationController

  def index
    @all_actors = Actor.all
  end

  def show
    @your_actor = Actor.find(params[:id])
  end

end
