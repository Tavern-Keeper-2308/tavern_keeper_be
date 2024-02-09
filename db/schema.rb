# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.1].define(version: 2024_02_07_221412) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "encounter_monsters", force: :cascade do |t|
    t.bigint "encounter_id", null: false
    t.string "monster_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "monster_index"
    t.index ["encounter_id"], name: "index_encounter_monsters_on_encounter_id"
  end

  create_table "encounters", force: :cascade do |t|
    t.string "encounter_name"
    t.integer "party_size"
    t.integer "party_level"
    t.string "summary"
    t.string "description"
    t.string "treasure"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_name"
  end

  add_foreign_key "encounter_monsters", "encounters"
end
