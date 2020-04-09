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

ActiveRecord::Schema.define(version: 2020_04_09_152700) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "activities", force: :cascade do |t|
    t.string "external_id"
    t.string "athlete_id"
    t.string "activity_type"
    t.string "name"
    t.string "description"
    t.string "start_date"
    t.float "distance"
    t.float "average_speed"
    t.integer "moving_time"
    t.integer "elapsed_time"
    t.float "average_heartrate"
    t.integer "kudos_count"
    t.jsonb "start_latlng"
    t.jsonb "end_latlng"
    t.string "encoded_path"
    t.boolean "commute"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["external_id"], name: "index_activities_on_external_id", unique: true
  end

  create_table "failed_events", force: :cascade do |t|
    t.boolean "processed", default: false
    t.string "aspect_type"
    t.string "object_type"
    t.string "object_id"
    t.string "owner_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "authorization_token"
    t.string "refresh_token"
    t.integer "auth_token_expires_at"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid", unique: true
  end

  add_foreign_key "activities", "users", column: "athlete_id", primary_key: "uid"
end
