class Genreidtogame < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :genre, null: false, foreign_key: true
  end
end
