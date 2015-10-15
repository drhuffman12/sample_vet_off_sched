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

ActiveRecord::Schema.define(version: 20151014201911) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "pet_id"
    t.datetime "date_of_visit"
    t.boolean  "reminder"
    t.string   "reason"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "appointments", ["pet_id"], name: "index_appointments_on_pet_id"
  add_index "appointments", ["user_id"], name: "index_appointments_on_user_id"

  create_table "pets", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "name",       limit: 35
    t.string   "pet_type"
    t.string   "breed",      limit: 35
    t.integer  "age"
    t.integer  "weight"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "pets", ["user_id"], name: "index_pets_on_user_id"

  create_table "rights", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "rights", ["role_id"], name: "index_rights_on_role_id"
  add_index "rights", ["user_id"], name: "index_rights_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",              limit: 35
    t.string   "address"
    t.string   "city"
    t.string   "state",             limit: 20
    t.integer  "zip",               limit: 5
    t.string   "school"
    t.integer  "years_in_practice", limit: 3
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

end
