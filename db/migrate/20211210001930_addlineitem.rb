class Addlineitem < ActiveRecord::Migration[6.1]
  def change
    create_table "line_items", force: :cascade do |t|
      t.integer  "quantity",   default: 1
      t.integer  "product_id"
      t.integer  "cart_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.integer  "order_id"
    end
  end
end