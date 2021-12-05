class Genrecolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :genre, :string
  end
end
