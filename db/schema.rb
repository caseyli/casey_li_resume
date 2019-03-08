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

ActiveRecord::Schema.define(version: 20190308160200) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "newsletter_sign_ups", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "category",   limit: 255
    t.text     "notes"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "resume_entries", force: :cascade do |t|
    t.integer  "resume_entry_type_id"
    t.string   "title",                limit: 255
    t.integer  "start_month"
    t.integer  "start_year"
    t.integer  "end_month"
    t.integer  "end_year"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "order_by"
  end

  create_table "resume_entry_notes", force: :cascade do |t|
    t.integer  "resume_entry_id"
    t.string   "note",            limit: 255
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "order_by"
    t.string   "url",             limit: 255
    t.string   "link_text",       limit: 255
  end

  create_table "resume_entry_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "resource_type"
    t.integer  "resource_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource_type_and_resource_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.text     "value"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
    t.index ["role_id"], name: "index_users_roles_on_role_id", using: :btree
    t.index ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree
    t.index ["user_id"], name: "index_users_roles_on_user_id", using: :btree
  end

end
