class Foreignkeystojoin < ActiveRecord::Migration[6.1]
  def change
    add_reference :game_genres, :games, null: false, foreign_key: true
    add_reference :game_genres, :genres, null: false, foreign_key: true
    add_reference :games, :game_genres, null: false, foreign_key: true
  

  end
end
