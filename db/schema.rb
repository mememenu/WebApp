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

ActiveRecord::Schema.define(version: 20150918142801) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "hstore"

  create_table "banners", force: :cascade do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "place_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloudfront_url"
  end

  add_index "banners", ["place_id"], name: "index_banners_on_place_id", using: :btree

  create_table "categories", force: :cascade do |t|
    t.string   "name"
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
    t.string   "first_name"
    t.string   "last_name"
    t.string   "favorite_restaurant"
    t.string   "email"
    t.text     "message"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "dishes", force: :cascade do |t|
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
    t.integer  "menu_id"
    t.integer  "place_id"
  end

  add_index "dishes", ["category_id"], name: "index_dishes_on_category_id", using: :btree
  add_index "dishes", ["menu_id"], name: "index_dishes_on_menu_id", using: :btree
  add_index "dishes", ["place_id"], name: "index_dishes_on_place_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.string   "name",                         null: false
    t.string   "description"
    t.boolean  "reservations", default: false, null: false
    t.boolean  "hide",         default: true,  null: false
    t.float    "price"
    t.datetime "starts_at",                    null: false
    t.datetime "ends_at",                      null: false
    t.integer  "place_id"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "events", ["place_id"], name: "index_events_on_place_id", using: :btree

  create_table "headers", force: :cascade do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloudfront_url"
  end

  add_index "headers", ["place_id"], name: "index_headers_on_place_id", using: :btree

  create_table "home_pages", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.integer  "dish_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.boolean  "hide"
    t.string   "cloudfront_url"
    t.boolean  "default"
  end

  add_index "images", ["dish_id"], name: "index_images_on_dish_id", using: :btree

  create_table "lists", force: :cascade do |t|
    t.string   "name",                               null: false
    t.boolean  "hide",                default: true, null: false
    t.integer  "user_id"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
    t.string   "kind"
    t.integer  "home_page_id"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloudfront_url"
  end

  add_index "lists", ["home_page_id"], name: "index_lists_on_home_page_id", using: :btree
  add_index "lists", ["user_id"], name: "index_lists_on_user_id", using: :btree

  create_table "lists_places", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "list_id"
  end

  add_index "lists_places", ["list_id"], name: "index_lists_places_on_list_id", using: :btree
  add_index "lists_places", ["place_id"], name: "index_lists_places_on_place_id", using: :btree

  create_table "menus", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "hide"
    t.integer  "place_id"
    t.integer  "priority"
  end

  add_index "menus", ["place_id"], name: "index_menus_on_place_id", using: :btree

  create_table "places", force: :cascade do |t|
    t.string   "name"
    t.string   "address_1"
    t.string   "address_2",               default: ""
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
    t.integer  "owner_id"
    t.string   "google_id"
    t.string   "cloudfront_url"
    t.integer  "price"
    t.text     "quotes"
  end

  add_index "places", ["owner_id"], name: "index_places_on_owner_id", using: :btree
  add_index "places", ["slug"], name: "index_places_on_slug", using: :btree

  create_table "places_tags", id: false, force: :cascade do |t|
    t.integer "place_id"
    t.integer "tag_id"
  end

  add_index "places_tags", ["place_id"], name: "index_places_tags_on_place_id", using: :btree
  add_index "places_tags", ["tag_id"], name: "index_places_tags_on_tag_id", using: :btree

  create_table "spotlight_items", force: :cascade do |t|
    t.integer  "spotlight_id"
    t.integer  "spotable_id"
    t.string   "spotable_type"
    t.integer  "position"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloudfront_url"
  end

  add_index "spotlight_items", ["spotable_type", "spotable_id"], name: "index_spotlight_items_on_spotable_type_and_spotable_id", using: :btree
  add_index "spotlight_items", ["spotlight_id"], name: "index_spotlight_items_on_spotlight_id", using: :btree

  create_table "spotlights", force: :cascade do |t|
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "home_page_id"
  end

  add_index "spotlights", ["home_page_id"], name: "index_spotlights_on_home_page_id", using: :btree

  create_table "tags", force: :cascade do |t|
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "hide"
  end

  add_index "tags", ["name"], name: "index_tags_on_name", using: :btree

  create_table "tiles", force: :cascade do |t|
    t.integer  "place_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "cloudfront_url"
  end

  add_index "tiles", ["place_id"], name: "index_tiles_on_place_id", using: :btree

  create_table "topics", force: :cascade do |t|
    t.string   "title",          null: false
    t.integer  "topicable_id"
    t.string   "topicable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "target_date",    null: false
  end

  add_index "topics", ["title"], name: "index_topics_on_title", using: :btree
  add_index "topics", ["topicable_type", "topicable_id"], name: "index_topics_on_topicable_type_and_topicable_id", using: :btree

  create_table "tracked_events", force: :cascade do |t|
    t.string   "kind",           null: false
    t.string   "eventable_type"
    t.string   "user_id"
    t.string   "ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "eventable_id"
    t.string   "title"
  end

  add_index "tracked_events", ["eventable_type"], name: "index_tracked_events_on_eventable_type", using: :btree
  add_index "tracked_events", ["kind"], name: "index_tracked_events_on_kind", using: :btree

  create_table "users", force: :cascade do |t|
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
    t.string   "facebook_id"
    t.string   "twitter_id"
    t.string   "instagram_id"
    t.string   "gender"
    t.string   "locale"
    t.string   "first_name"
    t.string   "last_name"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
