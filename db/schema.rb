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

ActiveRecord::Schema.define(version: 20170521215048) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "assists", force: :cascade do |t|
    t.string "name"
    t.integer "sp_cost"
    t.integer "range"
    t.text "effect"
    t.string "inherit_restriction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "colors", force: :cascade do |t|
    t.string "name"
  end

  create_table "heroes", force: :cascade do |t|
    t.string "name"
    t.string "title"
    t.bigint "weapon_type_id"
    t.bigint "movement_type_id"
    t.bigint "color_id"
    t.bigint "weapon_id"
    t.bigint "assist_id"
    t.bigint "special_id"
    t.bigint "a_passive_id"
    t.bigint "b_passive_id"
    t.bigint "c_passive_id"
    t.index ["a_passive_id"], name: "index_heroes_on_a_passive_id"
    t.index ["assist_id"], name: "index_heroes_on_assist_id"
    t.index ["b_passive_id"], name: "index_heroes_on_b_passive_id"
    t.index ["c_passive_id"], name: "index_heroes_on_c_passive_id"
    t.index ["color_id"], name: "index_heroes_on_color_id"
    t.index ["movement_type_id"], name: "index_heroes_on_movement_type_id"
    t.index ["special_id"], name: "index_heroes_on_special_id"
    t.index ["weapon_id"], name: "index_heroes_on_weapon_id"
    t.index ["weapon_type_id"], name: "index_heroes_on_weapon_type_id"
  end

  create_table "movement_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "passives", force: :cascade do |t|
    t.string "slot"
    t.string "name"
    t.integer "sp_cost"
    t.text "effect"
    t.string "inherit_restriction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "specials", force: :cascade do |t|
    t.string "name"
    t.integer "sp_cost"
    t.integer "cooldown"
    t.text "effect"
    t.string "inherit_restriction"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapon_types", force: :cascade do |t|
    t.string "name"
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "sp_cost"
    t.integer "damage"
    t.integer "range"
    t.text "effect"
    t.boolean "exclusive"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "heroes", "assists"
  add_foreign_key "heroes", "colors"
  add_foreign_key "heroes", "movement_types"
  add_foreign_key "heroes", "specials"
  add_foreign_key "heroes", "weapon_types"
  add_foreign_key "heroes", "weapons"
end
