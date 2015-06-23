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

ActiveRecord::Schema.define(version: 20150623145811) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_id"
    t.boolean  "hide"
    t.integer  "restaurant_id"
    t.integer  "priority"
  end

  add_index "categories", ["menu_id"], name: "index_categories_on_menu_id", using: :btree
  add_index "categories", ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree

  create_table "contacts", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "favorite_restaurant"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
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
    t.integer  "menu_id"
    t.integer  "restaurant_id"
    t.string   "cloud_front"
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id", using: :btree
  add_index "dishes", ["menu_id"], name: "index_dishes_on_menu_id", using: :btree
  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "images", force: true do |t|
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "hide"
    t.string   "cloudfront_url"
  end

  add_index "images", ["dish_id"], name: "index_images_on_dish_id", using: :btree

  create_table "ingredients", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.text     "description"
    t.integer  "dish_id"
  end

  add_index "ingredients", ["dish_id"], name: "index_ingredients_on_dish_id", using: :btree
  add_index "ingredients", ["restaurant_id"], name: "index_ingredients_on_restaurant_id", using: :btree

  create_table "menus", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "restaurant_id"
    t.integer  "priority"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "restaurant_banners", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "restaurant_banners", ["restaurant_id"], name: "index_restaurant_banners_on_restaurant_id", using: :btree

  create_table "restaurant_headers", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "restaurant_headers", ["restaurant_id"], name: "index_restaurant_headers_on_restaurant_id", using: :btree

  create_table "restaurant_tiles", force: true do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloud_front"
  end

  add_index "restaurant_tiles", ["restaurant_id"], name: "index_restaurant_tiles_on_restaurant_id", using: :btree

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
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug"
    t.string   "zone"
    t.string   "region"
    t.string   "monday_hours"
    t.string   "tuesday_hours"
    t.string   "wednesday_hours"
    t.string   "thursday_hours"
    t.string   "friday_hours"
    t.string   "saturday_hours"
    t.string   "sunday_hours"
    t.string   "website"
    t.string   "photographer_name"
    t.string   "photographer_media_link"
    t.string   "facebook"
    t.string   "twitter"
    t.string   "instagram"
    t.string   "maps_url"
    t.string   "clean_name"
    t.string   "delivery_url"
    t.string   "foursquare_id"
    t.string   "status"
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug", using: :btree

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
    t.integer  "restaurant_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["restaurant_id"], name: "index_users_on_restaurant_id", using: :btree

end
