class Removecolumnfromgenres < ActiveRecord::Migration[6.1]
  def change
    remove_column  :genres, :game_genres_id
  end
end
