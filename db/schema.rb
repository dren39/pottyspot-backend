ActiveRecord::Schema.define(version: 2019_04_30_213719) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ratings", force: :cascade do |t|
    t.integer "value"
    t.bigint "user_id"
    t.bigint "toilet_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["toilet_id"], name: "index_ratings_on_toilet_id"
    t.index ["user_id"], name: "index_ratings_on_user_id"
  end

  create_table "toilets", force: :cascade do |t|
    t.integer "api_id"
    t.string "name"
    t.string "street"
    t.string "city"
    t.string "state"
    t.text "directions"
    t.text "comments"
    t.float "lat"
    t.float "long"
    t.float "distance"
    t.string "password"
    t.boolean "purchase"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
  end

  add_foreign_key "ratings", "toilets"
  add_foreign_key "ratings", "users"
end
