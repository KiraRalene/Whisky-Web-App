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

ActiveRecord::Schema.define(version: 20170406202701) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "likes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "note_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_likes_on_note_id", using: :btree
    t.index ["user_id"], name: "index_likes_on_user_id", using: :btree
  end

  create_table "notes", force: :cascade do |t|
    t.string   "color"
    t.string   "nose"
    t.string   "palate"
    t.text     "description"
    t.integer  "price"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "whisky_id"
    t.index ["user_id"], name: "index_notes_on_user_id", using: :btree
    t.index ["whisky_id"], name: "index_notes_on_whisky_id", using: :btree
  end

  create_table "ratings", force: :cascade do |t|
    t.integer  "whisky_id"
    t.integer  "note_id"
    t.integer  "score"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["note_id"], name: "index_ratings_on_note_id", using: :btree
    t.index ["whisky_id"], name: "index_ratings_on_whisky_id", using: :btree
  end

  create_table "searches", force: :cascade do |t|
    t.string   "keywords"
    t.string   "kind"
    t.integer  "age"
    t.string   "distillery"
    t.float    "min_price"
    t.float    "max_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
  end

  create_table "whiskies", force: :cascade do |t|
    t.string   "name"
    t.string   "distillery"
    t.integer  "age"
    t.string   "cask"
    t.string   "kind"
    t.float    "abv"
    t.integer  "price"
    t.string   "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.text     "details"
    t.index ["user_id"], name: "index_whiskies_on_user_id", using: :btree
  end

  create_table "wishes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "whisky_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_wishes_on_user_id", using: :btree
    t.index ["whisky_id"], name: "index_wishes_on_whisky_id", using: :btree
  end

  add_foreign_key "likes", "notes"
  add_foreign_key "likes", "users"
  add_foreign_key "notes", "users"
  add_foreign_key "notes", "whiskies"
  add_foreign_key "whiskies", "users"
  add_foreign_key "wishes", "users"
  add_foreign_key "wishes", "whiskies"
end
