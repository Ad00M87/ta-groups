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

ActiveRecord::Schema.define(version: 20171128002750) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "courses", force: :cascade do |t|
    t.integer "canvas_course_id"
    t.string "name"
    t.boolean "active", default: true
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "groups", force: :cascade do |t|
    t.jsonb "ta"
    t.jsonb "students"
    t.bigint "mod_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mod_id"], name: "index_groups_on_mod_id"
  end

  create_table "mods", force: :cascade do |t|
    t.string "name"
    t.boolean "active", default: true
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_mods_on_course_id"
  end

  create_table "notes", force: :cascade do |t|
    t.text "content", default: ""
    t.string "author"
    t.bigint "mod_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["mod_id"], name: "index_notes_on_mod_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.integer "canvas_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.string "email"
    t.index ["course_id"], name: "index_students_on_course_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "teaching_assistants", force: :cascade do |t|
    t.string "name"
    t.string "avatar"
    t.integer "canvas_id"
    t.bigint "course_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.bigint "user_id"
    t.index ["course_id"], name: "index_teaching_assistants_on_course_id"
    t.index ["user_id"], name: "index_teaching_assistants_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "provider", default: "email", null: false
    t.string "uid", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.string "name"
    t.string "nickname"
    t.string "image"
    t.string "email"
    t.json "tokens"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "role", default: "user"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "groups", "mods"
  add_foreign_key "mods", "courses"
  add_foreign_key "notes", "mods"
  add_foreign_key "students", "courses"
  add_foreign_key "teaching_assistants", "courses"
end
