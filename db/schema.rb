# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_05_07_163938) do

  create_table "beers", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "abv"
    t.string "tagline"
  end

  create_table "beers_food_pairings", id: false, force: :cascade do |t|
    t.integer "food_pairing_id", null: false
    t.integer "beer_id", null: false
    t.index ["beer_id", "food_pairing_id"], name: "index_beers_food_pairings_on_beer_id_and_food_pairing_id"
    t.index ["food_pairing_id", "beer_id"], name: "index_beers_food_pairings_on_food_pairing_id_and_beer_id"
  end

  create_table "food_pairings", force: :cascade do |t|
    t.string "food"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "user_id"
    t.integer "beer_id"
    t.float "rating"
    t.string "description"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
  end

  add_foreign_key "beers_food_pairings", "beers"
  add_foreign_key "beers_food_pairings", "food_pairings"
end
