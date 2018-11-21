create_table "active_storage_attachments", force: :cascade do |t|
  t.string "name", null: false
  t.string "record_type", null: false
  t.integer "record_id", null: false
  t.integer "blob_id", null: false
  t.datetime "created_at", null: false
  t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
  t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
end

create_table "active_storage_blobs", force: :cascade do |t|
  t.string "key", null: false
  t.string "filename", null: false
  t.string "content_type"
  t.text "metadata"
  t.bigint "byte_size", null: false
  t.string "checksum", null: false
  t.datetime "created_at", null: false
  t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
end

create_table "colors", force: :cascade do |t|
  t.string "name"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "customers", force: :cascade do |t|
  t.string "last_name"
  t.string "first_name"
  t.string "street_address"
  t.string "city"
  t.integer "state_id"
  t.string "zip_code"
  t.string "phone_number"
  t.string "email"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["state_id"], name: "index_customers_on_state_id"
end

create_table "inventories", force: :cascade do |t|
  t.integer "year"
  t.integer "make_id"
  t.integer "model_id"
  t.integer "color_id"
  t.integer "mileage"
  t.decimal "wholesale_price", precision: 8, scale: 2
  t.string "vin"
  t.boolean "sold"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["color_id"], name: "index_inventories_on_color_id"
  t.index ["make_id"], name: "index_inventories_on_make_id"
  t.index ["model_id"], name: "index_inventories_on_model_id"
end

create_table "makes", force: :cascade do |t|
  t.string "name"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "models", force: :cascade do |t|
  t.integer "make_id"
  t.string "name"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["make_id"], name: "index_models_on_make_id"
end

create_table "quotes", force: :cascade do |t|
  t.integer "customer_id"
  t.integer "inventory_id"
  t.decimal "price"
  t.boolean "sold"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.index ["customer_id"], name: "index_quotes_on_customer_id"
  t.index ["inventory_id"], name: "index_quotes_on_inventory_id"
end

create_table "roles", force: :cascade do |t|
  t.string "name"
  t.integer "level"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "states", force: :cascade do |t|
  t.string "state_name"
  t.string "state_abbr"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
end

create_table "users", force: :cascade do |t|
  t.string "email", default: "", null: false
  t.string "encrypted_password", default: "", null: false
  t.string "reset_password_token"
  t.datetime "reset_password_sent_at"
  t.datetime "remember_created_at"
  t.datetime "created_at", null: false
  t.datetime "updated_at", null: false
  t.string "first_name"
  t.string "last_name"
  t.integer "role_id", default: 1
  t.index ["email"], name: "index_users_on_email", unique: true
  t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  t.index ["role_id"], name: "index_users_on_role_id"
end