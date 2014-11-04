# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20141104185108) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_id"
  end

  add_index "categories", ["menu_id"], name: "index_categories_on_menu_id", using: :btree

  create_table "cuisines", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "genre"
  end

  create_table "dishes", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "portion_size"
    t.integer  "spice"
    t.boolean  "hot"
    t.boolean  "gluten_free"
    t.boolean  "vegetarian"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "category_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id", using: :btree

  create_table "images", force: true do |t|
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "images", ["dish_id"], name: "index_images_on_dish_id", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
  end

  create_table "restaurant_cuisines", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "cuisine_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_cuisines", ["cuisine_id"], name: "index_restaurant_cuisines_on_cuisine_id", using: :btree
  add_index "restaurant_cuisines", ["restaurant_id"], name: "index_restaurant_cuisines_on_restaurant_id", using: :btree

  create_table "restaurant_menus", force: true do |t|
    t.integer  "restaurant_id"
    t.integer  "menu_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "restaurant_menus", ["menu_id"], name: "index_restaurant_menus_on_menu_id", using: :btree
  add_index "restaurant_menus", ["restaurant_id"], name: "index_restaurant_menus_on_restaurant_id", using: :btree

  create_table "restaurants", force: true do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2"
    t.string   "city"
    t.string   "state"
    t.string   "zipcode"
    t.text     "description"
    t.string   "phone"
    t.integer  "dollars"
    t.boolean  "reservations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "restaurant"
    t.string   "provider"
    t.string   "uid"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
