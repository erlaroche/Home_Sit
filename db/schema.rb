# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140122043756) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: true do |t|
    t.string   "date"
    t.string   "time_start"
    t.string   "time_end"
    t.string   "address"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "zip_code"
    t.integer  "owner_id"
    t.integer  "sitter_id"
  end

  add_index "appointments", ["owner_id"], name: "index_appointments_on_owner_id", using: :btree
  add_index "appointments", ["sitter_id"], name: "index_appointments_on_sitter_id", using: :btree

  create_table "owners", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "registered"
    t.integer  "appointment_id"
    t.string   "phone_number"
  end

  add_index "owners", ["appointment_id"], name: "index_owners_on_appointment_id", using: :btree

  create_table "services", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sitters", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "phone_number"
    t.string   "zip_code"
    t.string   "refresh_token"
    t.string   "picture"
    t.string   "linked_in"
    t.string   "google_id"
    t.string   "email"
  end

end
