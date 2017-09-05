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

ActiveRecord::Schema.define(version: 20170904171342) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "outcrop_photos", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.text     "base64image"
    t.string   "filename"
    t.string   "outcrop_id"
    t.float    "persisted_time", null: false
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_outcrop_photos_on_uuid", using: :btree
  end

  create_table "outcrops", id: false, force: :cascade do |t|
    t.string   "uuid",             null: false
    t.float    "altitude"
    t.float    "date_time"
    t.string   "description"
    t.string   "horizontal_datum"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "name"
    t.string   "toponomy"
    t.string   "stage_id"
    t.integer  "deleted_at"
    t.float    "persisted_time",   null: false
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["uuid"], name: "index_outcrops_on_uuid", using: :btree
  end

  create_table "projects", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.string   "name"
    t.string   "creator_id"
    t.string   "user_id"
    t.integer  "deleted_at"
    t.float    "persisted_time", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_projects_on_uuid", using: :btree
  end

  create_table "rock_photos", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.text     "base64image"
    t.string   "filename"
    t.string   "rock_id"
    t.float    "persisted_time", null: false
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_rock_photos_on_uuid", using: :btree
  end

  create_table "rock_structure_associations", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.float    "persisted_time", null: false
    t.string   "structure_id"
    t.string   "rock_id"
    t.string   "outcrop_id"
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_rock_structure_associations_on_uuid", using: :btree
  end

  create_table "rocks", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.string   "composition"
    t.string   "degree"
    t.string   "mineralogy"
    t.string   "name"
    t.string   "nomenclature"
    t.string   "size"
    t.string   "texture"
    t.string   "trama"
    t.integer  "type"
    t.float    "persisted_time", null: false
    t.string   "outcrop_id"
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_rocks_on_uuid", using: :btree
  end

  create_table "sample_photos", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.text     "base64image"
    t.string   "filename"
    t.float    "persisted_time", null: false
    t.string   "sample_id"
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_sample_photos_on_uuid", using: :btree
  end

  create_table "samples", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.string   "name"
    t.float    "persisted_time", null: false
    t.string   "outcrop_id"
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_samples_on_uuid", using: :btree
  end

  create_table "stages", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.string   "city"
    t.string   "name"
    t.string   "uf"
    t.string   "project_id"
    t.float    "persisted_time", null: false
    t.float    "initial_date"
    t.integer  "deleted_at"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_stages_on_uuid", using: :btree
  end

  create_table "structure_photos", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.text     "base64image"
    t.string   "filename"
    t.integer  "deleted_at"
    t.float    "persisted_time", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_structure_photos_on_uuid", using: :btree
  end

  create_table "structures", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.string   "description"
    t.float    "dip"
    t.float    "dip_direction"
    t.string   "name"
    t.string   "phase"
    t.integer  "type"
    t.integer  "deleted_at"
    t.float    "persisted_time", null: false
    t.string   "outcrop_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_structures_on_uuid", using: :btree
  end

  create_table "users", id: false, force: :cascade do |t|
    t.string   "uuid",           null: false
    t.string   "email"
    t.integer  "deleted_at"
    t.float    "persisted_time", null: false
    t.string   "name"
    t.string   "password_hash"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["uuid"], name: "index_users_on_uuid", using: :btree
  end

end
