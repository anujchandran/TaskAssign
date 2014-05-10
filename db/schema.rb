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

ActiveRecord::Schema.define(version: 20140509092303) do

  create_table "project_tables", force: true do |t|
    t.integer  "user_id"
    t.string   "project_name", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.string   "owner_name"
    t.integer  "time_spend"
    t.string   "status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "screen_shots", force: true do |t|
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "file_avatars_file_name"
    t.string   "file_avatars_content_type"
    t.integer  "file_avatars_file_size"
    t.datetime "file_avatars_updated_at"
  end

  create_table "tasks", force: true do |t|
    t.integer  "user_id"
    t.string   "task_name",                                 null: false
    t.string   "tracker"
    t.text     "description"
    t.string   "status"
    t.string   "priority",                 default: "none", null: false
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "estimated_hours"
    t.string   "per_done"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "project_table_id"
    t.string   "file_avatar_file_name"
    t.string   "file_avatar_content_type"
    t.integer  "file_avatar_file_size"
    t.datetime "file_avatar_updated_at"
    t.integer  "position"
  end

  create_table "teams", force: true do |t|
    t.string   "team_name",   null: false
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "user_name",                      null: false
    t.string   "email"
    t.boolean  "is_active",       default: true
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "user_type"
    t.string   "auth_token"
    t.string   "team_id"
  end

end
