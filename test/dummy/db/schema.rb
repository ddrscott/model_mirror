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

ActiveRecord::Schema.define(version: 20161218221449) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "iso2"
    t.string "iso3"
    t.string "un"
  end

  create_table "doors", force: :cascade do |t|
    t.string "sku"
  end

  add_index "doors", ["sku"], name: "index_doors_on_sku", using: :btree

  create_table "handles", force: :cascade do |t|
    t.integer "openable_id"
    t.string  "openable_type"
    t.string  "sku"
  end

  add_index "handles", ["openable_type", "openable_id"], name: "index_handles_on_openable_type_and_openable_id", using: :btree
  add_index "handles", ["sku"], name: "index_handles_on_sku", using: :btree

  create_table "home_doors", force: :cascade do |t|
    t.integer "home_id"
    t.integer "door_id"
    t.string  "location"
  end

  create_table "homes", force: :cascade do |t|
    t.string  "address"
    t.integer "country_id"
  end

  create_table "items", force: :cascade do |t|
    t.string  "sku"
    t.integer "height"
    t.integer "width"
    t.integer "depth"
  end

  add_index "items", ["sku"], name: "index_items_on_sku", using: :btree

end
