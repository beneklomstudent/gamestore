class AddColumntoGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :genres_id, :bigint
  end
end
