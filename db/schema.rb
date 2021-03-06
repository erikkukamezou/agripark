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

ActiveRecord::Schema.define(version: 2021_10_28_155457) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "comments", force: :cascade do |t|
    t.text "comment_content"
    t.bigint "user_id"
    t.bigint "dairy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dairy_id"], name: "index_comments_on_dairy_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "costs", force: :cascade do |t|
    t.integer "sale"
    t.integer "fertilizer"
    t.integer "soil"
    t.integer "seed"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "record_date"
    t.integer "miscellaneous_expenses"
    t.index ["user_id"], name: "index_costs_on_user_id"
  end

  create_table "dairies", force: :cascade do |t|
    t.string "title"
    t.text "content"
    t.text "image"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "date"
    t.index ["user_id"], name: "index_dairies_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_events_on_user_id"
  end

  create_table "manufactures", force: :cascade do |t|
    t.integer "harvest"
    t.integer "indoor_temperature"
    t.integer "soil_temperature"
    t.integer "humidity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.date "date"
    t.text "weather"
    t.integer "atmospheric_temperature"
    t.string "air"
    t.string "solar"
    t.string "precipitation"
    t.index ["user_id"], name: "index_manufactures_on_user_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.text "work"
    t.text "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "event_id"
    t.index ["event_id"], name: "index_tasks_on_event_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", default: "", null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "admin", default: false
    t.string "avatar"
    t.text "introdution"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "comments", "dairies"
  add_foreign_key "comments", "users"
  add_foreign_key "costs", "users"
  add_foreign_key "dairies", "users"
  add_foreign_key "events", "users"
  add_foreign_key "manufactures", "users"
  add_foreign_key "tasks", "events"
end
