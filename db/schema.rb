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

ActiveRecord::Schema.define(version: 20171026123323) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "internal_control_actions", force: :cascade do |t|
    t.integer  "trading_year"
    t.integer  "code"
    t.string   "description"
    t.integer  "internal_control_procedure_id"
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.string   "updated_by"
    t.index ["code"], name: "index_internal_control_actions_on_code", using: :btree
    t.index ["internal_control_procedure_id"], name: "index_internal_control_actions_on_internal_control_procedure_id", using: :btree
    t.index ["trading_year"], name: "index_internal_control_actions_on_trading_year", using: :btree
  end

  create_table "internal_control_files", force: :cascade do |t|
    t.integer  "trading_year"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "updated_by"
    t.index ["code"], name: "index_internal_control_files_on_code", using: :btree
    t.index ["trading_year"], name: "index_internal_control_files_on_trading_year", using: :btree
  end

  create_table "internal_control_procedures", force: :cascade do |t|
    t.integer  "trading_year"
    t.integer  "code"
    t.string   "description"
    t.integer  "internal_control_file_id"
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
    t.string   "updated_by"
    t.index ["code"], name: "index_internal_control_procedures_on_code", using: :btree
    t.index ["internal_control_file_id"], name: "index_internal_control_procedures_on_internal_control_file_id", using: :btree
    t.index ["trading_year"], name: "index_internal_control_procedures_on_trading_year", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.integer  "trading_year"
    t.string   "sap_proposal"
    t.string   "file_number"
    t.integer  "internal_control_file_id"
    t.integer  "internal_control_procedure_id"
    t.integer  "internal_control_action_id"
    t.string   "title"
    t.string   "manager_body"
    t.string   "approval_body"
    t.decimal  "amount",                        precision: 15, scale: 2
    t.string   "received_at"
    t.string   "sap_kind"
    t.string   "accounting_document"
    t.string   "expense_nature"
    t.string   "contract_type"
    t.string   "adjudication_way"
    t.string   "third_party_name"
    t.string   "third_party_id"
    t.string   "third_party_nit"
    t.string   "gexap_task"
    t.text     "observations"
    t.datetime "created_at",                                             null: false
    t.datetime "updated_at",                                             null: false
    t.string   "updated_by"
    t.index ["internal_control_action_id"], name: "index_proposals_on_internal_control_action_id", using: :btree
    t.index ["internal_control_file_id"], name: "index_proposals_on_internal_control_file_id", using: :btree
    t.index ["internal_control_procedure_id"], name: "index_proposals_on_internal_control_procedure_id", using: :btree
    t.index ["trading_year"], name: "index_proposals_on_trading_year", using: :btree
  end

  create_table "proposals_requeriments", id: false, force: :cascade do |t|
    t.integer  "proposals_id"
    t.integer  "requeriments_check_id"
    t.boolean  "initial_meet"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
    t.string   "initial_updated_by"
    t.boolean  "revision_meet"
    t.string   "revision_updated_by"
    t.index ["proposals_id"], name: "index_proposals_requeriments_on_proposals_id", using: :btree
    t.index ["requeriments_check_id"], name: "index_proposals_requeriments_on_requeriments_check_id", using: :btree
  end

  create_table "requeriments", force: :cascade do |t|
    t.string   "kind"
    t.integer  "code"
    t.string   "description"
    t.string   "non_observance_level"
    t.string   "discrepancy_allowed"
    t.string   "legal_reference"
    t.string   "trading_year"
    t.string   "updated_by"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.index ["code"], name: "index_requeriments_on_code", using: :btree
    t.index ["kind"], name: "index_requeriments_on_kind", using: :btree
    t.index ["trading_year"], name: "index_requeriments_on_trading_year", using: :btree
  end

  create_table "sap_codes", force: :cascade do |t|
    t.string   "sap_field"
    t.string   "sicia_att"
    t.string   "code"
    t.string   "description"
    t.string   "updated_by"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["code"], name: "index_sap_codes_on_code", using: :btree
    t.index ["sap_field"], name: "index_sap_codes_on_sap_field", using: :btree
    t.index ["sicia_att"], name: "index_sap_codes_on_sicia_att", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key"
    t.string   "value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "internal_control_actions", "internal_control_procedures"
  add_foreign_key "internal_control_procedures", "internal_control_files"
  add_foreign_key "proposals", "internal_control_actions"
  add_foreign_key "proposals", "internal_control_files"
  add_foreign_key "proposals", "internal_control_procedures"
end
