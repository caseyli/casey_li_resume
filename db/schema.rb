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

ActiveRecord::Schema.define(version: 20131012232206) do

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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_by"
  end

  create_table "resume_entry_notes", force: :cascade do |t|
    t.integer  "resume_entry_id"
    t.string   "note",            limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order_by"
    t.string   "url",             limit: 255
    t.string   "link_text",       limit: 255
  end

  create_table "resume_entry_types", force: :cascade do |t|
    t.string   "description", limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "settings", force: :cascade do |t|
    t.string   "key",        limit: 255
    t.text     "value"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",              limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password", limit: 255
    t.string   "salt",               limit: 255
  end

end
