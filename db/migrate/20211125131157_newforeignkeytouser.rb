class Newforeignkeytouser < ActiveRecord::Migration[6.1]
  def change
    add_reference :listings, :users, null: false, foreign_key: true
  end
end
