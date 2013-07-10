class JoinActorsAndMovies < ActiveRecord::Migration
  def up
    create_table :actors_movies, id: false do |t|
      t.belongs_to :movie
      t.belongs_to :actor
    end
  end

  def down
    drop_table :actors_movies
  end
end
