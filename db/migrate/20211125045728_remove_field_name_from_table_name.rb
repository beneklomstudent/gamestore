class RemoveFieldNameFromTableName < ActiveRecord::Migration[6.1]
  def change
    remove_column :games, :game_genres_id
  end
end
