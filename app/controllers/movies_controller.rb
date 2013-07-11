class MoviesController < ApplicationController

  def index
    @all_movies = Movie.all
  end


  def new
    @result = Imdb::Search.new(params[:movie_searched]).movies
  end

  def view_detail
    @selected = Imdb::Movie.new(params[:movie_id])
  end

  def create
    movie_to_pulldown = Imdb::Movie.new(params[:movie_id])
    tomatoes = params[:tomatoes]

    if Movie.all.map(&:title).include?(movie_to_pulldown.title)
      redirect_to(saved_already_path)
    else
      movie_to_save = Movie.new

      movie_to_save.title = movie_to_pulldown.title
      movie_to_save.year = movie_to_pulldown.year
      movie_to_save.plot = movie_to_pulldown.plot
      movie_to_save.mpaa_rating = movie_to_pulldown.mpaa_rating
      movie_to_save.tomatoes = tomatoes
      movie_to_save.save

      redirect_to('/movies')
    end
    # movie_to_pulldown.cast_members
  end

  def saved_already
  end

end
