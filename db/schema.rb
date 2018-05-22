ActiveRecord::Schema.define(version: 2018_05_22_105458) do

  create_table "cart_details", force: :cascade do |t|
    t.integer "cart_id"
    t.integer "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cart_id", "item_id"], name: "index_cart_details_on_cart_id_and_item_id"
  end

  create_table "carts", force: :cascade do |t|
    t.string "customer_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "name"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
