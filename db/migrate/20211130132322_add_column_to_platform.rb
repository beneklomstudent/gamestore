class AddColumnToPlatform < ActiveRecord::Migration[6.1]
  def change
    add_column :platforms, :console, :string
  end
end
