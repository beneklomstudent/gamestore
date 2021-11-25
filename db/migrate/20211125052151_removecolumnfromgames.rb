class Removecolumnfromgames < ActiveRecord::Migration[6.1]
  def change
    remove_column  :games, :genres_id
  end
end
