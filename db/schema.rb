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

ActiveRecord::Schema.define(version: 2019_03_12_052753) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "buildings", force: :cascade do |t|
    t.string "building_uuid"
    t.string "name"
    t.integer "account_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "time_zone"
    t.text "description"
    t.string "building_photo_big"
    t.string "building_photo_small"
    t.integer "visibility", default: 0, null: false
    t.string "working_hours"
    t.string "street"
    t.string "phone"
    t.string "label"
    t.text "building_polygon"
    t.datetime "deleted_at"
    t.integer "order", default: 0
    t.boolean "published", default: false
    t.geometry "multipolygon", limit: {:srid=>4326, :type=>"geometry"}
  end

  create_table "floors", force: :cascade do |t|
    t.bigint "building_id"
    t.integer "position"
    t.string "title"
    t.float "floor_polygon", array: true
    t.json "transformation"
    t.string "deployment_photo"
    t.json "wgs_transformation"
    t.float "ppm", array: true
    t.boolean "published", default: false
    t.datetime "deleted_at"
    t.integer "floor"
    t.float "height", default: 1.0, null: false
    t.float "deployment_photo_width"
    t.float "deployment_photo_height"
    t.geometry "multipolygon", limit: {:srid=>4326, :type=>"geometry"}
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_floors_on_building_id"
  end

  create_table "sensors", force: :cascade do |t|
    t.bigint "floor_id"
    t.bigint "building_id"
    t.float "coordinates", array: true
    t.integer "device_type"
    t.integer "major"
    t.integer "minor"
    t.integer "tx_power"
    t.bigint "cc1310_id"
    t.string "sn"
    t.float "rssi"
    t.float "coordinates_wgs", array: true
    t.integer "beacon_type", default: 1
    t.string "type", null: false
    t.string "stone_name"
    t.geometry "position", limit: {:srid=>4326, :type=>"geometry"}
    t.float "height", default: 0.0
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["building_id"], name: "index_sensors_on_building_id"
    t.index ["floor_id"], name: "index_sensors_on_floor_id"
  end

  add_foreign_key "floors", "buildings"
  add_foreign_key "sensors", "buildings"
  add_foreign_key "sensors", "floors"
end
