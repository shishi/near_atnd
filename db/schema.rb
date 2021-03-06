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

ActiveRecord::Schema.define(version: 20160429065418) do

  create_table "atendees", force: :cascade do |t|
    t.integer  "user_id",    limit: 4, null: false
    t.integer  "event_id",   limit: 4, null: false
    t.integer  "status",     limit: 4, null: false
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "atendees", ["event_id"], name: "index_atendees_on_event_id", using: :btree
  add_index "atendees", ["status"], name: "index_atendees_on_status", using: :btree
  add_index "atendees", ["user_id"], name: "index_atendees_on_user_id", using: :btree

  create_table "events", force: :cascade do |t|
    t.integer  "user_id",     limit: 4,     null: false
    t.string   "title",       limit: 255,   null: false
    t.datetime "hold_at",                   null: false
    t.integer  "capacity",    limit: 4,     null: false
    t.string   "location",    limit: 255,   null: false
    t.string   "owner",       limit: 255,   null: false
    t.text     "description", limit: 65535, null: false
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "events", ["user_id"], name: "index_events_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.integer  "uid",         limit: 4,   null: false
    t.string   "name",        limit: 255, null: false
    t.string   "nickname",    limit: 255, null: false
    t.string   "image",       limit: 255, null: false
    t.string   "description", limit: 255, null: false
    t.string   "token",       limit: 255, null: false
    t.string   "secret",      limit: 255, null: false
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "users", ["uid"], name: "index_users_on_uid", using: :btree

end
