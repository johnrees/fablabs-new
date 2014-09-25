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

ActiveRecord::Schema.define(version: 20140915205522) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.datetime "starts_at"
    t.datetime "ends_at"
    t.string   "workflow_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "events", ["creator_id"], name: "index_events_on_creator_id", using: :btree
  add_index "events", ["workflow_state"], name: "index_events_on_workflow_state", using: :btree

  create_table "labs", force: true do |t|
    t.integer  "creator_id"
    t.string   "name"
    t.text     "description"
    t.string   "workflow_state", null: false
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "labs", ["creator_id"], name: "index_labs_on_creator_id", using: :btree
  add_index "labs", ["workflow_state"], name: "index_labs_on_workflow_state", using: :btree

  create_table "recoveries", force: true do |t|
    t.integer  "user_id"
    t.string   "key"
    t.string   "ip"
    t.string   "workflow_state"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "recoveries", ["user_id"], name: "index_recoveries_on_user_id", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "submissions", force: true do |t|
    t.integer  "creator_id"
    t.integer  "lab_id"
    t.string   "workflow_state"
    t.text     "notes"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "submissions", ["creator_id", "lab_id"], name: "index_submissions_on_creator_id_and_lab_id", unique: true, using: :btree

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
