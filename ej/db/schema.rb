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

ActiveRecord::Schema.define(version: 20160620235731) do

  create_table "ahoy_events", force: :cascade do |t|
    t.uuid     "visit_id",   limit: 16
    t.integer  "user_id",    limit: 4
    t.string   "name",       limit: 255
    t.text     "properties", limit: 65535
    t.datetime "time"
  end

  add_index "ahoy_events", ["time"], name: "index_ahoy_events_on_time", using: :btree
  add_index "ahoy_events", ["user_id"], name: "index_ahoy_events_on_user_id", using: :btree
  add_index "ahoy_events", ["visit_id"], name: "index_ahoy_events_on_visit_id", using: :btree

  create_table "assignments", force: :cascade do |t|
    t.string   "title",            limit: 255
    t.text     "description",      limit: 65535
    t.datetime "draft_deadline"
    t.datetime "final_deadline"
    t.datetime "created_at",                     null: false
    t.datetime "updated_at",                     null: false
    t.datetime "comment_deadline"
    t.text     "description2",     limit: 65535
    t.boolean  "is2group"
  end

  create_table "ckeditor_assets", force: :cascade do |t|
    t.string   "data_file_name",    limit: 255, null: false
    t.string   "data_content_type", limit: 255
    t.integer  "data_file_size",    limit: 4
    t.integer  "assetable_id",      limit: 4
    t.string   "assetable_type",    limit: 30
    t.string   "type",              limit: 30
    t.integer  "width",             limit: 4
    t.integer  "height",            limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], name: "idx_ckeditor_assetable", using: :btree
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], name: "idx_ckeditor_assetable_type", using: :btree

  create_table "comment_answers", force: :cascade do |t|
    t.text     "content",           limit: 65535
    t.integer  "user_id",           limit: 4
    t.integer  "comment_id",        limit: 4
    t.integer  "comment_prompt_id", limit: 4
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
  end

  create_table "comment_forms", force: :cascade do |t|
    t.integer  "group_number",  limit: 4
    t.string   "name",          limit: 255
    t.integer  "assignment_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
    t.string   "question1",     limit: 255
    t.string   "question2",     limit: 255
    t.string   "question3",     limit: 255
    t.string   "question4",     limit: 255
    t.string   "hint1",         limit: 255
    t.string   "hint2",         limit: 255
    t.string   "hint3",         limit: 255
    t.string   "hint4",         limit: 255
  end

  create_table "comment_prompts", force: :cascade do |t|
    t.string   "question",        limit: 255
    t.string   "hint",            limit: 255
    t.integer  "comment_form_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "comments", force: :cascade do |t|
    t.text     "content",         limit: 65535
    t.integer  "user_id",         limit: 4
    t.integer  "post_id",         limit: 4
    t.integer  "comment_form_id", limit: 4
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.text     "answer1",         limit: 65535
    t.text     "answer2",         limit: 65535
    t.text     "answer3",         limit: 65535
    t.text     "answer4",         limit: 65535
  end

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.integer  "post_id",    limit: 4
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text     "content",       limit: 65535
    t.integer  "post_id",       limit: 4
    t.integer  "user_id",       limit: 4
    t.integer  "assignment_id", limit: 4
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "positions", force: :cascade do |t|
    t.string   "title",         limit: 255
    t.integer  "assignment_id", limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "posts", force: :cascade do |t|
    t.string   "headline",      limit: 255
    t.text     "draft1",        limit: 65535
    t.text     "draft2",        limit: 65535
    t.integer  "user_id",       limit: 4
    t.integer  "assignment_id", limit: 4
    t.integer  "position_id",   limit: 4
    t.boolean  "bookmarked",                  default: false
    t.boolean  "submitted",                   default: false
    t.datetime "created_at",                                  null: false
    t.datetime "updated_at",                                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",                   limit: 255, default: "",    null: false
    t.string   "email",                  limit: 255, default: "",    null: false
    t.string   "encrypted_password",     limit: 255, default: "",    null: false
    t.boolean  "admin",                              default: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                         null: false
    t.datetime "updated_at",                                         null: false
    t.boolean  "optout"
    t.string   "assigned_groups",        limit: 255
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "visits", force: :cascade do |t|
    t.uuid     "visitor_id",       limit: 16
    t.string   "ip",               limit: 255
    t.text     "user_agent",       limit: 65535
    t.text     "referrer",         limit: 65535
    t.text     "landing_page",     limit: 65535
    t.integer  "user_id",          limit: 4
    t.string   "referring_domain", limit: 255
    t.string   "search_keyword",   limit: 255
    t.string   "browser",          limit: 255
    t.string   "os",               limit: 255
    t.string   "device_type",      limit: 255
    t.integer  "screen_height",    limit: 4
    t.integer  "screen_width",     limit: 4
    t.string   "country",          limit: 255
    t.string   "region",           limit: 255
    t.string   "city",             limit: 255
    t.string   "postal_code",      limit: 255
    t.decimal  "latitude",                       precision: 10
    t.decimal  "longitude",                      precision: 10
    t.string   "utm_source",       limit: 255
    t.string   "utm_medium",       limit: 255
    t.string   "utm_term",         limit: 255
    t.string   "utm_content",      limit: 255
    t.string   "utm_campaign",     limit: 255
    t.datetime "started_at"
  end

  add_index "visits", ["user_id"], name: "index_visits_on_user_id", using: :btree

end
