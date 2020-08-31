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

ActiveRecord::Schema.define(version: 2020_08_28_115658) do

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "chats", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "sentence", null: false
    t.boolean "is_solved", null: false
    t.boolean "isAdmin", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "classrooms", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "favorites", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lost_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lost_id"], name: "index_favorites_on_lost_id"
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.string "name", null: false
    t.string "teacher", null: false
    t.integer "classroom_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["classroom_id"], name: "index_lessons_on_classroom_id"
  end

  create_table "losts", force: :cascade do |t|
    t.string "name", null: false
    t.string "detail", null: false
    t.string "category", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_losts_on_lesson_id"
  end

  create_table "matters", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lost_id"
    t.string "eve"
    t.boolean "is_solved"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lost_id"], name: "index_matters_on_lost_id"
    t.index ["user_id"], name: "index_matters_on_user_id"
  end

  create_table "take_lessons", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "lesson_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["lesson_id"], name: "index_take_lessons_on_lesson_id"
    t.index ["user_id"], name: "index_take_lessons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.string "faculty", null: false
    t.integer "grade", null: false
    t.boolean "admin", null: false
    t.string "password_digest", null: false
    t.string "student_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
