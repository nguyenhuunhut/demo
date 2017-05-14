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

ActiveRecord::Schema.define(version: 20161120130536) do

  create_table "classrooms", force: :cascade do |t|
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.string   "name",       limit: 255
    t.string   "subject",    limit: 255
    t.integer  "total",      limit: 4
    t.integer  "fee",        limit: 4
    t.integer  "month",      limit: 4
    t.string   "schedule",   limit: 255
    t.date     "start"
    t.integer  "course_id",  limit: 4
    t.integer  "user_id",    limit: 4
  end

  create_table "courses", force: :cascade do |t|
    t.string   "name",        limit: 255
    t.string   "description", limit: 255
    t.integer  "user_id",     limit: 4
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  create_table "notications", force: :cascade do |t|
    t.integer  "id_from",    limit: 4
    t.integer  "id_to",      limit: 4
    t.string   "content",    limit: 255
    t.boolean  "status",                 default: true
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
  end

  create_table "registereds", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "classroom_id", limit: 4
    t.boolean  "is_register",            default: false
    t.boolean  "is_pay",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "registers", force: :cascade do |t|
    t.integer  "user_id",      limit: 4
    t.integer  "classroom_id", limit: 4
    t.integer  "course_id",    limit: 4
    t.boolean  "is_register",            default: false
    t.boolean  "is_pay",                 default: false
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",      limit: 255
    t.string   "password",   limit: 255
    t.string   "name",       limit: 255
    t.string   "phone",      limit: 255
    t.string   "address",    limit: 255
    t.integer  "role",       limit: 4,   default: 0
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

end
