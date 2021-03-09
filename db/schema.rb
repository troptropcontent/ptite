# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2021_03_09_083139) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "events", force: :cascade do |t|
    t.bigint "place_id"
    t.datetime "date"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "privacy_id", null: false
    t.index ["place_id"], name: "index_events_on_place_id"
    t.index ["privacy_id"], name: "index_events_on_privacy_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "friend_request_statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "friend_requests", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "friend_request_status_id", null: false
    t.bigint "friend_id", null: false
    t.index ["friend_id"], name: "index_friend_requests_on_friend_id"
    t.index ["friend_request_status_id"], name: "index_friend_requests_on_friend_request_status_id"
    t.index ["user_id"], name: "index_friend_requests_on_user_id"
  end

  create_table "friends", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_friends_on_user_id"
  end

  create_table "invitation_statuses", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.bigint "event_id"
    t.bigint "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "invitation_status_id", null: false
    t.index ["event_id"], name: "index_invitations_on_event_id"
    t.index ["invitation_status_id"], name: "index_invitations_on_invitation_status_id"
    t.index ["user_id"], name: "index_invitations_on_user_id"
  end

  create_table "places", force: :cascade do |t|
    t.string "name"
    t.string "street_address"
    t.integer "zip"
    t.string "city"
    t.string "country"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "privacies", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "username"
    t.string "last_name"
    t.string "first_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "events", "places"
  add_foreign_key "events", "privacies"
  add_foreign_key "events", "users"
  add_foreign_key "friend_requests", "friend_request_statuses"
  add_foreign_key "friend_requests", "friends"
  add_foreign_key "friend_requests", "users"
  add_foreign_key "friends", "users"
  add_foreign_key "invitations", "events"
  add_foreign_key "invitations", "invitation_statuses"
  add_foreign_key "invitations", "users"
end
