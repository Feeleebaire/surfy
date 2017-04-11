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

ActiveRecord::Schema.define(version: 20170411194431) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "camp_bookings", force: :cascade do |t|
    t.integer  "nbr_surfers"
    t.integer  "slot_id"
    t.integer  "camp_id"
    t.integer  "user_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["camp_id"], name: "index_camp_bookings_on_camp_id", using: :btree
    t.index ["slot_id"], name: "index_camp_bookings_on_slot_id", using: :btree
    t.index ["user_id"], name: "index_camp_bookings_on_user_id", using: :btree
  end

  create_table "camp_reviews", force: :cascade do |t|
    t.integer  "rate"
    t.string   "title"
    t.text     "comment"
    t.integer  "camp_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_camp_reviews_on_camp_id", using: :btree
    t.index ["user_id"], name: "index_camp_reviews_on_user_id", using: :btree
  end

  create_table "camps", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "language"
    t.string   "address"
    t.integer  "organisation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "photo"
    t.index ["organisation_id"], name: "index_camps_on_organisation_id", using: :btree
  end

  create_table "organisations", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.string   "photo"
    t.index ["user_id"], name: "index_organisations_on_user_id", using: :btree
  end

  create_table "slots", force: :cascade do |t|
    t.integer  "price"
    t.integer  "nbr_surfers"
    t.date     "start_date"
    t.date     "end_date"
    t.integer  "camp_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["camp_id"], name: "index_slots_on_camp_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "camp_bookings", "camps"
  add_foreign_key "camp_bookings", "slots"
  add_foreign_key "camp_bookings", "users"
  add_foreign_key "camp_reviews", "camps"
  add_foreign_key "camp_reviews", "users"
  add_foreign_key "camps", "organisations"
  add_foreign_key "organisations", "users"
  add_foreign_key "slots", "camps"
end
