class AddColumnGameToListing < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :gamename, :string
  end
end

