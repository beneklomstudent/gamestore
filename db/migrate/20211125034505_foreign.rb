class Foreign < ActiveRecord::Migration[6.1]
  def change
    add_reference :genres, :game_genres, null: true, foreign_key: true
  end
end
