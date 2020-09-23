# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_09_18_104813) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.bigint "resource_id"
    t.string "author_type"
    t.bigint "author_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "areas", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "country_id", null: false
    t.bigint "state_id"
    t.bigint "city_id", null: false
    t.bigint "region_id"
    t.bigint "pincode_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_areas_on_city_id"
    t.index ["country_id"], name: "index_areas_on_country_id"
    t.index ["pincode_id"], name: "index_areas_on_pincode_id"
    t.index ["region_id"], name: "index_areas_on_region_id"
    t.index ["state_id"], name: "index_areas_on_state_id"
  end

  create_table "business_branches", force: :cascade do |t|
    t.string "name"
    t.boolean "head", default: false
    t.string "subdomain"
    t.integer "entity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "business_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_categories_on_active"
  end

  create_table "business_categories_sub_categories", force: :cascade do |t|
    t.integer "category_id"
    t.integer "sub_category_id"
  end

  create_table "business_entities", force: :cascade do |t|
    t.string "name", null: false
    t.text "description", null: false
    t.boolean "active", default: true, null: false
    t.boolean "verified", default: false, null: false
    t.integer "registration_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_entities_on_active"
    t.index ["name"], name: "index_business_entities_on_name"
    t.index ["registration_type_id"], name: "index_business_entities_on_registration_type_id"
    t.index ["verified"], name: "index_business_entities_on_verified"
  end

  create_table "business_galleries", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "galleryable_type"
    t.integer "galleryable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["galleryable_type", "galleryable_id"], name: "index_business_galleries_on_galleryable_type_and_galleryable_id"
  end

  create_table "business_gallery_media", force: :cascade do |t|
    t.string "caption"
    t.integer "gallery_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "business_infos", force: :cascade do |t|
    t.string "website"
    t.integer "entity_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "business_proof_types", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_proof_types_on_active"
    t.index ["name"], name: "index_business_proof_types_on_name"
  end

  create_table "business_registration_types", force: :cascade do |t|
    t.string "name"
    t.text "description", null: false
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_registration_types_on_active"
    t.index ["name"], name: "index_business_registration_types_on_name"
  end

  create_table "business_roles", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_roles_on_active"
  end

  create_table "business_services", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_services_on_active"
    t.index ["name"], name: "index_business_services_on_name"
  end

  create_table "business_sub_categories", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_sub_categories_on_active"
  end

  create_table "business_themes", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true, null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["active"], name: "index_business_themes_on_active"
  end

  create_table "business_working_hours", force: :cascade do |t|
    t.integer "day"
    t.date "opens_at"
    t.date "closed_at"
    t.string "workable_type"
    t.integer "workable_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "cities", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "country_id", null: false
    t.bigint "state_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_cities_on_country_id"
    t.index ["state_id"], name: "index_cities_on_state_id"
  end

  create_table "countries", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "countries_country_groups", id: false, force: :cascade do |t|
    t.bigint "country_id", null: false
    t.bigint "country_group_id", null: false
    t.index ["country_group_id", "country_id"], name: "country_group_country"
    t.index ["country_id", "country_group_id"], name: "country_country_group"
  end

  create_table "country_group_types", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "country_groups", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "country_group_type_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_group_type_id"], name: "index_country_groups_on_country_group_type_id"
  end

  create_table "pincodes", force: :cascade do |t|
    t.string "code"
    t.boolean "active", default: true
    t.bigint "country_id", null: false
    t.bigint "state_id"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_pincodes_on_city_id"
    t.index ["country_id"], name: "index_pincodes_on_country_id"
    t.index ["state_id"], name: "index_pincodes_on_state_id"
  end

  create_table "regions", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "country_id", null: false
    t.bigint "state_id"
    t.bigint "city_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["city_id"], name: "index_regions_on_city_id"
    t.index ["country_id"], name: "index_regions_on_country_id"
    t.index ["state_id"], name: "index_regions_on_state_id"
  end

  create_table "states", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.boolean "active", default: true
    t.bigint "country_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["country_id"], name: "index_states_on_country_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "areas", "cities"
  add_foreign_key "areas", "countries"
  add_foreign_key "areas", "pincodes"
  add_foreign_key "areas", "regions"
  add_foreign_key "areas", "states"
  add_foreign_key "cities", "countries"
  add_foreign_key "cities", "states"
  add_foreign_key "country_groups", "country_group_types"
  add_foreign_key "pincodes", "cities"
  add_foreign_key "pincodes", "countries"
  add_foreign_key "pincodes", "states"
  add_foreign_key "regions", "cities"
  add_foreign_key "regions", "countries"
  add_foreign_key "regions", "states"
  add_foreign_key "states", "countries"
end
