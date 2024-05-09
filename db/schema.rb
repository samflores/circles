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

ActiveRecord::Schema[7.1].define(version: 2024_05_08_234849) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "circles", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_circles_on_profile_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "circle_id", null: false
    t.bigint "profile_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["circle_id"], name: "index_friendships_on_circle_id"
    t.index ["profile_id"], name: "index_friendships_on_profile_id"
  end

  create_table "profiles", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.boolean "tos_agreement", default: false, null: false
    t.date "born_on", default: nil, null: false
    t.index ["email"], name: "index_profiles_on_email", unique: true
  end

  create_table "reactions", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "status_id", null: false
    t.integer "symbol", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["profile_id"], name: "index_reactions_on_profile_id"
    t.index ["status_id"], name: "index_reactions_on_status_id"
  end

  create_table "statuses", force: :cascade do |t|
    t.text "body", null: false
    t.bigint "profile_id", null: false
    t.bigint "parent_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["parent_id"], name: "index_statuses_on_parent_id"
    t.index ["profile_id"], name: "index_statuses_on_profile_id"
  end

  add_foreign_key "circles", "profiles"
  add_foreign_key "friendships", "circles"
  add_foreign_key "friendships", "profiles"
  add_foreign_key "reactions", "profiles"
  add_foreign_key "reactions", "statuses"
  add_foreign_key "statuses", "profiles"
  add_foreign_key "statuses", "statuses", column: "parent_id"
end
