class MoviesController < ApplicationController

  def new
    @result = Imdb::Search.new(params[:movie_searched]).movies
  end

  def view_detail
    @selected = Imdb::Movie.new(params[:movie_id])
  end

  def save
    movie_to_pulldown = Imdb::Movie.new(params[:movie_id])

    # if Movie.all.include?(movie_to_pulldown)
    #   redirect_to('/alreadysaved')
    # else
    movie_to_save = Movie.new

    movie_to_save.title = movie_to_pulldown.title
    movie_to_save.year = movie_to_pulldown.year
    movie_to_save.plot = movie_to_pulldown.plot
    movie_to_save.mpaa_rating = movie_to_pulldown.mpaa_rating
    movie_to_save.tomatoes = 50
    movie_to_save.save

    redirect_to('/movies')
    # movie_to_pulldown.cast_members

  end

end
