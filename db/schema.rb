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

ActiveRecord::Schema.define(version: 20151107104402) do

  create_table "addresses", force: :cascade do |t|
    t.string   "street"
    t.string   "suburb"
    t.string   "postcode"
    t.string   "state"
    t.string   "country"
    t.string   "used_for"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "addresses", ["customer_id"], name: "index_addresses_on_customer_id"

  create_table "assignments", force: :cascade do |t|
    t.integer  "employee_id"
    t.integer  "customer_id"
    t.float    "duration"
    t.datetime "start_at"
    t.datetime "end_at"
    t.string   "status"
    t.datetime "signed_at"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.float    "rate"
    t.string   "postponed"
  end

  add_index "assignments", ["customer_id"], name: "index_assignments_on_customer_id"
  add_index "assignments", ["employee_id"], name: "index_assignments_on_employee_id"

  create_table "contacts", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.string   "company"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "customer_id"
  end

  add_index "contacts", ["customer_id"], name: "index_contacts_on_customer_id"

  create_table "customers", force: :cascade do |t|
    t.string   "name"
    t.string   "fiscal_name"
    t.string   "abn"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.string   "title"
    t.string   "role"
    t.boolean  "assigned"
    t.boolean  "active"
    t.datetime "joined_company_at"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "division"
  end

  create_table "time_offs", force: :cascade do |t|
    t.datetime "start_at"
    t.integer  "duration"
    t.string   "motive"
    t.integer  "employee_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.datetime "end_at"
  end

  add_index "time_offs", ["employee_id"], name: "index_time_offs_on_employee_id"

end
