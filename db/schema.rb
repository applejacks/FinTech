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

ActiveRecord::Schema.define(version: 20140409210304) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "brands", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "entries", force: true do |t|
    t.integer  "promotion_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "title"
    t.string   "user_name"
    t.string   "user_email"
    t.integer  "past_promotion_id"
  end

  add_index "entries", ["promotion_id"], name: "index_entries_on_promotion_id", using: :btree

  create_table "messages", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "past_entries", force: true do |t|
    t.integer  "past_promotions_id"
    t.string   "title"
    t.string   "user_name"
    t.string   "user_email"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "past_entries", ["past_promotions_id"], name: "index_past_entries_on_past_promotions_id", using: :btree

  create_table "past_promotions", force: true do |t|
    t.integer  "brand_id"
    t.string   "title",                   limit: 50
    t.text     "details"
    t.text     "promotion_terms"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.datetime "created_at",                         null: false
    t.datetime "updated_at",                         null: false
  end

  add_index "past_promotions", ["brand_id"], name: "index_past_promotions_on_brand_id", using: :btree

  create_table "promotions", force: true do |t|
    t.integer  "brand_id"
    t.string   "title",                   limit: 50
    t.text     "details"
    t.string   "barcode"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "attachment_file_name"
    t.string   "attachment_content_type"
    t.integer  "attachment_file_size"
    t.datetime "attachment_updated_at"
    t.text     "promotion_terms"
  end

  add_index "promotions", ["brand_id"], name: "index_promotions_on_brand_id", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "role"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
