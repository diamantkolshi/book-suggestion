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

ActiveRecord::Schema.define(version: 20160820044025) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "access_codes", force: :cascade do |t|
    t.string   "al_code"
    t.string   "ks_code"
    t.string   "registration_code"
    t.boolean  "status",            default: true
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "countries", force: :cascade do |t|
    t.string   "name"
    t.integer  "prefix"
    t.integer  "code"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "items", force: :cascade do |t|
    t.integer  "category_id"
    t.integer  "country_id"
    t.string   "name"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.string   "email"
    t.string   "location"
    t.text     "title"
    t.text     "description"
    t.decimal  "price"
    t.string   "address"
    t.string   "phone"
    t.string   "code"
    t.boolean  "pending"
    t.boolean  "approve"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "items", ["category_id"], name: "index_items_on_category_id", using: :btree
  add_index "items", ["country_id"], name: "index_items_on_country_id", using: :btree

end
