# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_06_174263) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "cheeses", force: :cascade do |t|
    t.string "name"
    t.string "softness"
    t.string "country"
    t.string "region"
    t.string "milk"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "wine_id", null: false
    t.bigint "cheese_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "pairing_id", null: false
    t.index ["cheese_id"], name: "index_favorites_on_cheese_id"
    t.index ["pairing_id"], name: "index_favorites_on_pairing_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
    t.index ["wine_id"], name: "index_favorites_on_wine_id"
  end

  create_table "pairings", force: :cascade do |t|
    t.bigint "wines_id", null: false
    t.bigint "cheeses_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cheeses_id"], name: "index_pairings_on_cheeses_id"
    t.index ["wines_id"], name: "index_pairings_on_wines_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "username"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wines", force: :cascade do |t|
    t.string "name"
    t.string "family"
    t.string "variety"
    t.string "sweetness"
    t.string "country"
    t.string "region"
    t.integer "year"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_url"
  end

  add_foreign_key "favorites", "cheeses"
  add_foreign_key "favorites", "pairings"
  add_foreign_key "favorites", "users"
  add_foreign_key "favorites", "wines"
  add_foreign_key "pairings", "cheeses", column: "cheeses_id"
  add_foreign_key "pairings", "wines", column: "wines_id"
end
