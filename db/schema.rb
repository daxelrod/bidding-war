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

ActiveRecord::Schema.define(version: 20171126214511) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bids", force: :cascade do |t|
    t.decimal "amount", precision: 7, scale: 2, null: false
    t.bigint "item_state_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_state_id"], name: "index_bids_on_item_state_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "marathon_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["marathon_id"], name: "index_events_on_marathon_id"
    t.index ["name", "marathon_id"], name: "index_events_on_name_and_marathon_id", unique: true
  end

  create_table "item_states", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_item_states_on_item_id"
    t.index ["name", "item_id"], name: "index_item_states_on_name_and_item_id", unique: true
  end

  create_table "items", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.bigint "event_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_items_on_event_id"
    t.index ["name", "event_id"], name: "index_items_on_name_and_event_id", unique: true
  end

  create_table "marathons", force: :cascade do |t|
    t.string "name", null: false
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_marathons_on_name", unique: true
  end

  add_foreign_key "bids", "item_states"
  add_foreign_key "events", "marathons"
  add_foreign_key "item_states", "items"
  add_foreign_key "items", "events"
end
