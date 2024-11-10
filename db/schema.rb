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

ActiveRecord::Schema[7.0].define(version: 2024_11_09_230249) do
  create_table "address_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "addresses", charset: "utf8mb4", force: :cascade do |t|
    t.string "street"
    t.string "number"
    t.string "city"
    t.string "state"
    t.string "postal_code"
    t.bigint "person_id", null: false
    t.bigint "address_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["address_type_id"], name: "index_addresses_on_address_type_id"
    t.index ["person_id"], name: "index_addresses_on_person_id"
  end

  create_table "claim_statuses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claim_statuses_claims", id: false, charset: "utf8mb4", force: :cascade do |t|
    t.bigint "claim_id", null: false
    t.bigint "claim_status_id", null: false
  end

  create_table "claim_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "claims", charset: "utf8mb4", force: :cascade do |t|
    t.text "description"
    t.bigint "person_id", null: false
    t.bigint "claim_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["claim_type_id"], name: "index_claims_on_claim_type_id"
    t.index ["person_id"], name: "index_claims_on_person_id"
  end

  create_table "document_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "family_member_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "family_members", charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.bigint "person_id", null: false
    t.bigint "family_member_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["family_member_type_id"], name: "index_family_members_on_family_member_type_id"
    t.index ["person_id"], name: "index_family_members_on_person_id"
  end

  create_table "genders", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "marital_statuses", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "organizations", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", charset: "utf8mb4", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "document"
    t.date "birth_date"
    t.bigint "gender_id", null: false
    t.bigint "marital_status_id", null: false
    t.bigint "document_type_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["document_type_id"], name: "index_people_on_document_type_id"
    t.index ["gender_id"], name: "index_people_on_gender_id"
    t.index ["marital_status_id"], name: "index_people_on_marital_status_id"
    t.index ["organization_id"], name: "index_people_on_organization_id"
  end

  create_table "phone_types", charset: "utf8mb4", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "phones", charset: "utf8mb4", force: :cascade do |t|
    t.string "number"
    t.bigint "person_id", null: false
    t.bigint "phone_type_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_phones_on_person_id"
    t.index ["phone_type_id"], name: "index_phones_on_phone_type_id"
  end

  create_table "users", charset: "utf8mb4", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "address_types"
  add_foreign_key "addresses", "people"
  add_foreign_key "claims", "claim_types"
  add_foreign_key "claims", "people"
  add_foreign_key "family_members", "family_member_types"
  add_foreign_key "family_members", "people"
  add_foreign_key "people", "document_types"
  add_foreign_key "people", "genders"
  add_foreign_key "people", "marital_statuses"
  add_foreign_key "people", "organizations"
  add_foreign_key "phones", "people"
  add_foreign_key "phones", "phone_types"
end
