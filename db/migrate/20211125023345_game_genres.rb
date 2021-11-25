class GameGenres < ActiveRecord::Migration[6.1]
  def change
    create_table :game_genres do |t|

      t.timestamps
    end
  end
end