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

ActiveRecord::Schema.define(version: 20171206100736) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string   "trackable_type"
    t.integer  "trackable_id"
    t.string   "owner_type"
    t.integer  "owner_id"
    t.string   "key"
    t.text     "parameters"
    t.string   "recipient_type"
    t.integer  "recipient_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["owner_id", "owner_type"], name: "index_activities_on_owner_id_and_owner_type", using: :btree
    t.index ["recipient_id", "recipient_type"], name: "index_activities_on_recipient_id_and_recipient_type", using: :btree
    t.index ["trackable_id", "trackable_type"], name: "index_activities_on_trackable_id_and_trackable_type", using: :btree
  end

  create_table "ejemplo_appointments", force: :cascade do |t|
    t.integer  "patient_id"
    t.integer  "physician_id"
    t.date     "appointment_date"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["patient_id"], name: "index_ejemplo_appointments_on_patient_id", using: :btree
    t.index ["physician_id"], name: "index_ejemplo_appointments_on_physician_id", using: :btree
  end

  create_table "ejemplo_patients", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ejemplo_physicians", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ic_action_requeriments", force: :cascade do |t|
    t.integer  "ic_action_id"
    t.integer  "requeriment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "updated_by"
    t.index ["ic_action_id"], name: "index_ic_action_requeriments_on_ic_action_id", using: :btree
    t.index ["requeriment_id"], name: "index_ic_action_requeriments_on_requeriment_id", using: :btree
  end

  create_table "ic_actions", force: :cascade do |t|
    t.integer  "trading_year"
    t.integer  "code"
    t.string   "description"
    t.integer  "ic_procedure_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "updated_by"
    t.index ["code"], name: "index_ic_actions_on_code", using: :btree
    t.index ["ic_procedure_id"], name: "index_ic_actions_on_ic_procedure_id", using: :btree
    t.index ["trading_year"], name: "index_ic_actions_on_trading_year", using: :btree
  end

  create_table "ic_files", force: :cascade do |t|
    t.integer  "trading_year"
    t.string   "code"
    t.string   "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "updated_by"
    t.index ["code"], name: "index_ic_files_on_code", using: :btree
    t.index ["trading_year"], name: "index_ic_files_on_trading_year", using: :btree
  end

  create_table "ic_procedures", force: :cascade do |t|
    t.integer  "trading_year"
    t.integer  "code"
    t.string   "description"
    t.integer  "ic_file_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "updated_by"
    t.index ["code"], name: "index_ic_procedures_on_code", using: :btree
    t.index ["ic_file_id"], name: "index_ic_procedures_on_ic_file_id", using: :btree
    t.index ["trading_year"], name: "index_ic_procedures_on_trading_year", using: :btree
  end

  create_table "manager_bodies", force: :cascade do |t|
    t.integer  "trading_year"
    t.string   "code"
    t.string   "budget_center"
    t.string   "budget_section"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["code"], name: "index_manager_bodies_on_code", using: :btree
    t.index ["trading_year"], name: "index_manager_bodies_on_trading_year", using: :btree
  end

  create_table "proposal_requeriments", force: :cascade do |t|
    t.integer  "proposal_id"
    t.integer  "requeriment_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "updated_by"
    t.datetime "revision_updated_at"
    t.string   "revision_updated_by"
    t.boolean  "initial_check"
    t.boolean  "revised_check"
    t.index ["proposal_id"], name: "index_proposal_requeriments_on_proposal_id", using: :btree
    t.index ["requeriment_id"], name: "index_proposal_requeriments_on_requeriment_id", using: :btree
  end

  create_table "proposals", force: :cascade do |t|
    t.integer  "trading_year"
    t.string   "sap_proposal"
    t.string   "file_number"
    t.integer  "ic_file_id"
    t.integer  "ic_procedure_id"
    t.integer  "ic_action_id"
    t.string   "title"
    t.string   "manager_body"
    t.string   "approval_body"
    t.decimal  "amount",              precision: 15, scale: 2
    t.string   "sap_kind"
    t.string   "accounting_document"
    t.string   "expense_nature"
    t.string   "contract_type"
    t.string   "adjudication_way"
    t.string   "third_party_name"
    t.string   "third_party_id"
    t.string   "third_party_nit"
    t.string   "gexap_task"
    t.date     "received_at"
    t.string   "notify_to"
    t.text     "observations"
    t.datetime "created_at",                                   null: false
    t.datetime "updated_at",                                   null: false
    t.string   "updated_by"
    t.index ["ic_action_id"], name: "index_proposals_on_ic_action_id", using: :btree
    t.index ["ic_file_id"], name: "index_proposals_on_ic_file_id", using: :btree
    t.index ["ic_procedure_id"], name: "index_proposals_on_ic_procedure_id", using: :btree
    t.index ["trading_year"], name: "index_proposals_on_trading_year", using: :btree
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

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["name"], name: "index_roles_on_name", using: :btree
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

  create_table "users", force: :cascade do |t|
    t.string   "ayre"
    t.integer  "uweb_id"
    t.string   "name"
    t.string   "first_surname"
    t.string   "second_surname"
    t.string   "document_number"
    t.string   "document_type"
    t.integer  "pernr"
    t.string   "phone"
    t.string   "official_position"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "ic_actions", "ic_procedures"
  add_foreign_key "ic_procedures", "ic_files"
  add_foreign_key "proposals", "ic_actions"
  add_foreign_key "proposals", "ic_files"
  add_foreign_key "proposals", "ic_procedures"
end
