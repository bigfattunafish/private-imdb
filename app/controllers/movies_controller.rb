class MoviesController < ApplicationController

  def new
    @result = Imdb::Search.new(params[:movie_searched]).movies
  end

  def view_detail
    @selected = Imdb::Movie.new(params[:movie_id])
  end

end
