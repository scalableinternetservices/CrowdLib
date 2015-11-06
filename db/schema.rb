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

<<<<<<< HEAD
<<<<<<< Updated upstream
ActiveRecord::Schema.define(version: 20151030223640) do
=======
<<<<<<< HEAD
ActiveRecord::Schema.define(version: 20151019080619) do
=======
ActiveRecord::Schema.define(version: 20151029200736) do
>>>>>>> Stashed changes
=======
ActiveRecord::Schema.define(version: 20151105175226) do
>>>>>>> trial2

  create_table "book_requests", force: :cascade do |t|
    t.integer  "book_id"
    t.integer  "lender_id"
    t.integer  "borrower_id"
    t.integer  "loan_period"
    t.boolean  "approved"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end
<<<<<<< Updated upstream
=======
>>>>>>> trial2
>>>>>>> Stashed changes

  create_table "books", force: :cascade do |t|
    t.string   "title"
    t.string   "author"
    t.string   "edition"
    t.string   "genre"
    t.decimal  "ratings"
    t.string   "image_url"
    t.string   "publisher"
    t.string   "ISBN"
    t.integer  "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "locations", force: :cascade do |t|
    t.float    "lat"
    t.float    "lng"
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
<<<<<<< Updated upstream
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "username"
    t.string   "first_name"
    t.string   "last_name"
<<<<<<< HEAD
=======
<<<<<<< HEAD
    t.string   "username"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "password"
    t.text     "address"
    t.decimal  "lender_rating"
    t.decimal  "borrower_rating"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
=======
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
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
>>>>>>> trial2
>>>>>>> Stashed changes
=======
    t.string   "profile_picture"
    t.string   "blurb"
>>>>>>> trial2
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
