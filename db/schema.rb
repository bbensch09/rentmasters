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

ActiveRecord::Schema.define(version: 20160102043512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "market_rents", force: :cascade do |t|
    t.string   "key"
    t.string   "neighborhood"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.float    "market_rent"
    t.string   "bedrooms"
  end

  create_table "quotes", force: :cascade do |t|
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "neighborhood"
    t.string   "bathrooms"
    t.string   "condition"
    t.integer  "current_rent"
    t.integer  "market_rents_id"
    t.string   "bedrooms"
    t.string   "slug"
  end

  add_index "quotes", ["market_rents_id"], name: "index_quotes_on_market_rents_id", using: :btree

end
