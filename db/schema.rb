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

ActiveRecord::Schema.define(version: 20171014155940) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "internal_control_actions", force: :cascade do |t|
    t.string   "trading_year"
    t.string   "code"
    t.string   "description"
    t.integer  "internal_control_procedure_id"
    t.string   "updated_by"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.index ["code"], name: "index_internal_control_actions_on_code", using: :btree
    t.index ["internal_control_procedure_id"], name: "index_internal_control_actions_on_internal_control_procedure_id", using: :btree
    t.index ["trading_year"], name: "index_internal_control_actions_on_trading_year", using: :btree
  end

  create_table "internal_control_areas", force: :cascade do |t|
    t.string   "trading_year"
    t.string   "code"
    t.string   "description"
    t.string   "updated_by"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["code"], name: "index_internal_control_areas_on_code", using: :btree
    t.index ["trading_year"], name: "index_internal_control_areas_on_trading_year", using: :btree
  end

  create_table "internal_control_procedures", force: :cascade do |t|
    t.string   "trading_year"
    t.string   "code"
    t.string   "description"
    t.integer  "internal_control_area_id"
    t.string   "updated_by"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.index ["code"], name: "index_internal_control_procedures_on_code", using: :btree
    t.index ["internal_control_area_id"], name: "index_internal_control_procedures_on_internal_control_area_id", using: :btree
    t.index ["trading_year"], name: "index_internal_control_procedures_on_trading_year", using: :btree
  end

  create_table "sap_codes", force: :cascade do |t|
    t.string   "field"
    t.string   "code"
    t.string   "description"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["code"], name: "index_sap_codes_on_code", using: :btree
    t.index ["field"], name: "index_sap_codes_on_field", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "internal_control_actions", "internal_control_procedures"
  add_foreign_key "internal_control_procedures", "internal_control_areas"
end
