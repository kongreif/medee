# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2022_05_31_084539) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "midi_categories", force: :cascade do |t|
    t.bigint "category_id", null: false
    t.bigint "midi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["category_id"], name: "index_midi_categories_on_category_id"
    t.index ["midi_id"], name: "index_midi_categories_on_midi_id"
  end

  create_table "midi_moods", force: :cascade do |t|
    t.bigint "mood_id", null: false
    t.bigint "midi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["midi_id"], name: "index_midi_moods_on_midi_id"
    t.index ["mood_id"], name: "index_midi_moods_on_mood_id"
  end

  create_table "midis", force: :cascade do |t|
    t.string "title"
    t.integer "download_count", default: 0
    t.integer "key_signature"
    t.string "time_signature"
    t.text "description"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_midis_on_user_id"
  end

  create_table "moods", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "upvotes", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "midi_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["midi_id"], name: "index_upvotes_on_midi_id"
    t.index ["user_id"], name: "index_upvotes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "midi_categories", "categories"
  add_foreign_key "midi_categories", "midis"
  add_foreign_key "midi_moods", "midis"
  add_foreign_key "midi_moods", "moods"
  add_foreign_key "midis", "users"
  add_foreign_key "upvotes", "midis"
  add_foreign_key "upvotes", "users"
end
