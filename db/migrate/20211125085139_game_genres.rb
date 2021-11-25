class GameGenres < ActiveRecord::Migration[6.1]
      create_table :game_genres do |t|
        t.references :game, null: false, foreign_key: true
        t.references :genre, null: false, foreign_key: true
        t.timestamps
      end
end