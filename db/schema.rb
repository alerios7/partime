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

ActiveRecord::Schema.define(version: 20150917002200) do

  create_table "companies", force: :cascade do |t|
    t.string   "name"
    t.string   "rut"
    t.string   "email"
    t.string   "phone"
    t.string   "contact_name"
    t.string   "contact_last_name"
    t.string   "token"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "companies", ["name"], name: "index_companies_on_name", unique: true
  add_index "companies", ["token"], name: "index_companies_on_token", unique: true

  create_table "employers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "company_id"
    t.string   "name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

  add_index "employers", ["company_id"], name: "index_employers_on_company_id"
  add_index "employers", ["email"], name: "index_employers_on_email", unique: true
  add_index "employers", ["reset_password_token"], name: "index_employers_on_reset_password_token", unique: true

  create_table "jobs", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "start_date"
    t.datetime "finish_date"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "store_id"
    t.integer  "worker_id"
    t.integer  "employer_id"
    t.string   "state"
  end

  add_index "jobs", ["employer_id"], name: "index_jobs_on_employer_id"
  add_index "jobs", ["store_id"], name: "index_jobs_on_store_id"
  add_index "jobs", ["worker_id"], name: "index_jobs_on_worker_id"

  create_table "stores", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "manager_name"
    t.string   "manager_lastname"
    t.string   "phone"
    t.string   "address"
    t.integer  "company_id"
    t.integer  "employer_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "stores", ["company_id"], name: "index_stores_on_company_id"
  add_index "stores", ["employer_id"], name: "index_stores_on_employer_id"

  create_table "workers", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.string   "name"
    t.string   "last_name"
    t.text     "rut"
    t.datetime "birthdate"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "college"
    t.string   "career"
    t.string   "address"
  end

  add_index "workers", ["confirmation_token"], name: "index_workers_on_confirmation_token", unique: true
  add_index "workers", ["email"], name: "index_workers_on_email", unique: true
  add_index "workers", ["reset_password_token"], name: "index_workers_on_reset_password_token", unique: true

end
