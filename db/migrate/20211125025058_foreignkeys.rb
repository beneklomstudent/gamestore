class Foreignkeys < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :games, null: false, foreign_key: true
  end
end
