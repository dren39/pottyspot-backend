# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_27_003107) do

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
    t.string "password"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ratings", "toilets"
  add_foreign_key "ratings", "users"
end
