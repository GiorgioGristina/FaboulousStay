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

ActiveRecord::Schema.define(version: 2022_04_15_144356) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.date "check_in"
    t.date "check_out"
    t.bigint "user_id", null: false
    t.bigint "flat_id", null: false
    t.integer "total_price"
    t.integer "number_of_nights"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.integer "number_of_guests"
    t.index ["flat_id"], name: "index_bookings_on_flat_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "flats", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.integer "number_of_bathrooms"
    t.integer "number_of_bedrooms"
    t.boolean "wifi"
    t.boolean "garden"
    t.boolean "hot_tub"
    t.boolean "parking"
    t.boolean "kitchen"
    t.boolean "tv"
    t.boolean "aircon"
    t.boolean "heating"
    t.integer "occupancy"
    t.integer "price_per_night"
    t.string "address"
    t.string "city"
    t.string "country"
    t.string "postcode"
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "home_type"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_flats_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "first_name"
    t.string "last_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "flats"
  add_foreign_key "bookings", "users"
  add_foreign_key "flats", "users"
end
