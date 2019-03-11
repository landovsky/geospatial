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

ActiveRecord::Schema.define(version: 2019_03_11_211213) do

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

end
