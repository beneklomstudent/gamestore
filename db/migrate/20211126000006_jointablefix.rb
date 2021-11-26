class Jointablefix < ActiveRecord::Migration[6.1]
def change
create_join_table :games, :genres do |t|
  t.index :game_id
  t.index :genre_id
  # t.add reference :listings, :games, null: false, foreign_key: true
  end
end
end