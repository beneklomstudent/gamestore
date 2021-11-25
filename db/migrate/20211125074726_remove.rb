class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column  :games, :genre_id
  end
end
