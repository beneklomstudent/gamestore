class Gametoprojects < ActiveRecord::Migration[6.1]
  def change
    add_reference :games, :listings, null: true, foreign_key: true
  end
end