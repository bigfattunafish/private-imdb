class MoviesController < ApplicationController

  def index
    @all_movies = Movie.all
  end

  def show
    @your_movie = Movie.find(params[:id])
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
    actors_in_movie = movie_to_pulldown.cast_members

    if Movie.all.map(&:title).include?(movie_to_pulldown.title)
      redirect_to(saved_already_path)
    else
      movie_to_save = Movie.new

      movie_to_save.title = movie_to_pulldown.title
      movie_to_save.year = movie_to_pulldown.year
      movie_to_save.plot = movie_to_pulldown.plot
      movie_to_save.mpaa_rating = movie_to_pulldown.mpaa_rating
      movie_to_save.tomatoes = tomatoes
      movie_to_save.poster = movie_to_pulldown.poster

      actors_in_movie.each do |actor|
        if Actor.where(name: actor).first.nil?
         new_actor = Actor.new
         new_actor.name = actor
         new_actor.save
         movie_to_save.actors << new_actor
        else
         movie_to_save.actors << Actor.where(name: actor).first
        end
      end

      movie_to_save.save

      redirect_to movies_path
    end

  end

  def saved_already
  end

  def edit
    @movie_to_edit = Movie.find(params[:id])
  end

  def update
    movie_to_update = Movie.find(params[:id])

    movie_to_update.title = params[:title]
    movie_to_update.year = params[:year]
    movie_to_update.plot = params[:plot]
    movie_to_update.mpaa_rating = params[:mpaa_rating]
    movie_to_update.tomatoes = params[:tomatoes]
    movie_to_update.save

    redirect_to movie_path
  end

  def destroy
    Movie.find(params[:movie_id]).destroy

    redirect_to movies_path
  end

  def vote_up
    movie_to_vote_up = Movie.find(params[:movie_id])
    unless movie_to_vote_up.tomatoes >= 100
      movie_to_vote_up.tomatoes += 1
      movie_to_vote_up.save
    end

    redirect_to movie_to_vote_up
  end

  def vote_down
    movie_to_vote_down = Movie.find(params[:movie_id])
    unless movie_to_vote_down.tomatoes <= 0
      movie_to_vote_down.tomatoes -= 1
      movie_to_vote_down.save
    end

    redirect_to movie_to_vote_down
  end

  def fav_it
    movie_to_fav = Movie.find(params[:movie_id])
    movie_to_fav.tomatoes = 100
    movie_to_fav.save

    redirect_to movie_to_fav
  end

end
