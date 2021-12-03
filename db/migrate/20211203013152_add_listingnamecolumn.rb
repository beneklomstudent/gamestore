class AddListingnamecolumn < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :listingname, :string
  end
end