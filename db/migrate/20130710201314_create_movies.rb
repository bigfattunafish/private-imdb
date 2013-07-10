class CreateMovies < ActiveRecord::Migration
  def up
    create_table :movies do |t|
      t.string :title
      t.string :year
      t.text :plot
      t.string :mpaa_rating
      t.integer :tomatoes
      t.timestamps
    end
  end

  def down
    drop_table :movies
  end
end
