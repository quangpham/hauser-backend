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

ActiveRecord::Schema.define(version: 20140424082115) do

  create_table "auths", force: true do |t|
    t.string   "token"
    t.string   "secret"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "auths", ["token"], name: "index_auths_on_token", unique: true, using: :btree

  create_table "facilities", force: true do |t|
    t.string   "name"
    t.text     "description"
    t.string   "facility_type"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "house_facility_rs", force: true do |t|
    t.integer  "house_id"
    t.integer  "facility_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "houses", force: true do |t|
    t.string   "address"
    t.text     "description"
    t.string   "thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pins", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "type"
    t.string   "photo_url"
    t.string   "icon_url"
    t.string   "from"
    t.integer  "user_id"
    t.integer  "house_id"
    t.boolean  "is_sticky",   default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "posts", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "user_id"
    t.date     "recorded_on"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_facility_bookings", force: true do |t|
    t.integer  "user_id"
    t.integer  "facility_id"
    t.date     "booking_date"
    t.string   "booking_slot"
    t.string   "facility_name"
    t.string   "facility_thumbnail"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "user_house_rs", force: true do |t|
    t.integer  "user_id"
    t.integer  "house_id"
    t.string   "room_number"
    t.string   "name_plate"
    t.boolean  "is_living_now",                        default: true
    t.boolean  "is_received_post_office_notification", default: false
    t.boolean  "is_received_nearby_ads",               default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "email",                  default: "",                                                null: false
    t.string   "encrypted_password",     default: "",                                                null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,                                                 null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone_number"
    t.string   "full_name"
    t.string   "avatar_url",             default: "http://www.ukm.my/farmasi/images/staff/user_avatar.png"
    t.integer  "confirmation_code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["phone_number"], name: "index_users_on_phone_number", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
