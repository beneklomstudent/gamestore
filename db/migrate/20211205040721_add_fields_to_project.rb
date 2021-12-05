class AddFieldsToProject < ActiveRecord::Migration[6.1]
  def change
    add_column :listings, :expires_at, :datetime, default: DateTime.now + 30.days
    add_column :listings, :status, :string, default: "active"
  end
end
