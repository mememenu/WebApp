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

ActiveRecord::Schema.define(version: 20150625161645) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_id"
    t.boolean  "hide"
    t.integer  "restaurant_id"
    t.integer  "priority"
  end

  add_index "categories", ["menu_id"], name: "index_categories_on_menu_id", using: :btree
  add_index "categories", ["restaurant_id"], name: "index_categories_on_restaurant_id", using: :btree

  create_table "contacts", force: :cascade do |t|
    t.string   "first_name",          limit: 255
    t.string   "last_name",           limit: 255
    t.string   "favorite_restaurant", limit: 255
    t.string   "email",               limit: 255
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: :cascade do |t|
    t.string   "name",                limit: 255
    t.text     "description"
    t.string   "portion_size",        limit: 255
    t.integer  "spice"
    t.boolean  "hot"
    t.boolean  "gluten_free"
    t.boolean  "vegetarian"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "category_id"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "menu_id"
    t.integer  "restaurant_id"
    t.string   "cloud_front",         limit: 255
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id", using: :btree
  add_index "dishes", ["menu_id"], name: "index_dishes_on_menu_id", using: :btree
  add_index "dishes", ["restaurant_id"], name: "index_dishes_on_restaurant_id", using: :btree

  create_table "images", force: :cascade do |t|
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "hide"
    t.string   "cloudfront_url",      limit: 255
  end

  add_index "images", ["dish_id"], name: "index_images_on_dish_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name",          limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "restaurant_id"
    t.integer  "priority"
  end

  add_index "menus", ["restaurant_id"], name: "index_menus_on_restaurant_id", using: :btree

  create_table "restaurant_banners", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "restaurant_id"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "restaurant_banners", ["restaurant_id"], name: "index_restaurant_banners_on_restaurant_id", using: :btree

  create_table "restaurant_headers", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "restaurant_headers", ["restaurant_id"], name: "index_restaurant_headers_on_restaurant_id", using: :btree

  create_table "restaurant_tiles", force: :cascade do |t|
    t.integer  "restaurant_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloud_front",         limit: 255
  end

  add_index "restaurant_tiles", ["restaurant_id"], name: "index_restaurant_tiles_on_restaurant_id", using: :btree

  create_table "restaurants", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "address_1",               limit: 255
    t.string   "address_2",               limit: 255
    t.string   "city",                    limit: 255
    t.string   "state",                   limit: 255
    t.string   "zipcode",                 limit: 255
    t.text     "description"
    t.string   "phone",                   limit: 255
    t.integer  "dollars"
    t.boolean  "reservations"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.string   "avatar_file_name",        limit: 255
    t.string   "avatar_content_type",     limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "slug",                    limit: 255
    t.string   "zone",                    limit: 255
    t.string   "region",                  limit: 255
    t.string   "monday_hours",            limit: 255
    t.string   "tuesday_hours",           limit: 255
    t.string   "wednesday_hours",         limit: 255
    t.string   "thursday_hours",          limit: 255
    t.string   "friday_hours",            limit: 255
    t.string   "saturday_hours",          limit: 255
    t.string   "sunday_hours",            limit: 255
    t.string   "website",                 limit: 255
    t.string   "photographer_name",       limit: 255
    t.string   "photographer_media_link", limit: 255
    t.string   "facebook",                limit: 255
    t.string   "twitter",                 limit: 255
    t.string   "instagram",               limit: 255
    t.string   "maps_url",                limit: 255
    t.string   "clean_name",              limit: 255
    t.string   "delivery_url",            limit: 255
    t.string   "foursquare_id",           limit: 255
    t.string   "status",                  limit: 255
    t.float    "latitude"
    t.float    "longitude"
  end

  add_index "restaurants", ["slug"], name: "index_restaurants_on_slug", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                      default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin"
    t.boolean  "restaurant"
    t.string   "provider",               limit: 255
    t.string   "uid",                    limit: 255
    t.integer  "restaurant_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  add_index "users", ["restaurant_id"], name: "index_users_on_restaurant_id", using: :btree

end
