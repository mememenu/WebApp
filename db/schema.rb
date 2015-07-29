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

ActiveRecord::Schema.define(version: 20150729201448) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "banners", ["place_id"], name: "index_banners_on_place_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name",       limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "menu_id"
    t.boolean  "hide"
    t.integer  "place_id"
    t.integer  "priority"
  end

  add_index "categories", ["menu_id"], name: "index_categories_on_menu_id", using: :btree
  add_index "categories", ["place_id"], name: "index_categories_on_place_id", using: :btree

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
    t.string   "name",         limit: 255
    t.text     "description"
    t.string   "portion_size", limit: 255
    t.integer  "spice"
    t.boolean  "hot"
    t.boolean  "gluten_free"
    t.boolean  "vegetarian"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "category_id"
    t.integer  "menu_id"
    t.integer  "place_id"
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id", using: :btree
  add_index "dishes", ["menu_id"], name: "index_dishes_on_menu_id", using: :btree
  add_index "dishes", ["place_id"], name: "index_dishes_on_place_id", using: :btree

  create_table "headers", force: :cascade do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
  end

  add_index "headers", ["place_id"], name: "index_headers_on_place_id", using: :btree

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
    t.boolean  "default"
  end

  add_index "images", ["dish_id"], name: "index_images_on_dish_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "place_id"
    t.integer  "priority"
  end

  add_index "menus", ["place_id"], name: "index_menus_on_place_id", using: :btree

  create_table "oauth_access_grants", force: :cascade do |t|
    t.integer  "resource_owner_id", null: false
    t.integer  "application_id",    null: false
    t.string   "token",             null: false
    t.integer  "expires_in",        null: false
    t.text     "redirect_uri",      null: false
    t.datetime "created_at",        null: false
    t.datetime "revoked_at"
    t.string   "scopes"
  end

  add_index "oauth_access_grants", ["token"], name: "index_oauth_access_grants_on_token", unique: true, using: :btree

  create_table "oauth_access_tokens", force: :cascade do |t|
    t.integer  "resource_owner_id"
    t.integer  "application_id"
    t.string   "token",             null: false
    t.string   "refresh_token"
    t.integer  "expires_in"
    t.datetime "revoked_at"
    t.datetime "created_at",        null: false
    t.string   "scopes"
  end

  add_index "oauth_access_tokens", ["refresh_token"], name: "index_oauth_access_tokens_on_refresh_token", unique: true, using: :btree
  add_index "oauth_access_tokens", ["resource_owner_id"], name: "index_oauth_access_tokens_on_resource_owner_id", using: :btree
  add_index "oauth_access_tokens", ["token"], name: "index_oauth_access_tokens_on_token", unique: true, using: :btree

  create_table "oauth_applications", force: :cascade do |t|
    t.string   "name",         null: false
    t.string   "uid",          null: false
    t.string   "secret",       null: false
    t.text     "redirect_uri", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "oauth_applications", ["uid"], name: "index_oauth_applications_on_uid", unique: true, using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name",                    limit: 255
    t.string   "address_1",               limit: 255
    t.string   "address_2",               limit: 255, default: ""
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
    t.integer  "owner_id"
  end

  add_index "places", ["owner_id"], name: "index_places_on_owner_id", using: :btree
  add_index "places", ["slug"], name: "index_places_on_slug", using: :btree

  create_table "tiles", force: :cascade do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name",    limit: 255
    t.string   "avatar_content_type", limit: 255
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloud_front",         limit: 255
  end

  add_index "tiles", ["place_id"], name: "index_tiles_on_place_id", using: :btree

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
