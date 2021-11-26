class CreateAddColumnToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :price, :integer
    end
end
