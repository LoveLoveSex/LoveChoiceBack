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

ActiveRecord::Schema.define(version: 20170901045114) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "hotel_services", force: :cascade do |t|
    t.integer "hotel_id", null: false
    t.string "name", null: false
    t.string "day_of_the_week"
    t.integer "money", null: false
    t.integer "category", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "hotels", force: :cascade do |t|
    t.integer "user_id_to_manage"
    t.string "image"
    t.string "name", null: false
    t.text "summary"
    t.string "hotel_url"
    t.string "street_address"
    t.string "phone_number"
    t.integer "access_count", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_hotels", force: :cascade do |t|
    t.integer "user_id"
    t.integer "hotel_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "first_name", default: "太郎", null: false
    t.string "last_name", default: "山田", null: false
    t.integer "sex", default: 0, null: false
    t.datetime "birthday", default: "2017-10-12 22:39:18", null: false
    t.integer "authority", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
