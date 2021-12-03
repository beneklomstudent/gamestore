class AddForeignKeyToPosts < ActiveRecord::Migration[6.1]
    def change
      add_reference :listings, :users, null: true, foreign_key: true
    end
  end