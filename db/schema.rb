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

ActiveRecord::Schema[7.0].define(version: 2023_02_10_063752) do
  create_table "answers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "question_id"
    t.integer "equipment_id"
    t.string "name"
    t.integer "user_id"
    t.index ["equipment_id"], name: "index_answers_on_equipment_id"
    t.index ["question_id"], name: "index_answers_on_question_id"
    t.index ["user_id"], name: "index_answers_on_user_id"
  end

  create_table "briefs", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "equipment_id"
    t.integer "title_id"
    t.integer "content_id"
    t.string "name"
    t.index ["content_id"], name: "index_briefs_on_content_id"
    t.index ["equipment_id"], name: "index_briefs_on_equipment_id"
    t.index ["title_id"], name: "index_briefs_on_title_id"
  end

  create_table "contents", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "equipment_id"
    t.integer "title_id"
    t.string "name"
    t.index ["equipment_id"], name: "index_contents_on_equipment_id"
    t.index ["title_id"], name: "index_contents_on_title_id"
  end

  create_table "equipment", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "status"
    t.text "feature"
    t.text "resolution"
    t.text "location"
    t.text "application"
    t.text "facilities"
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "content"
    t.integer "equipment_id"
    t.string "name"
    t.index ["equipment_id"], name: "index_questions_on_equipment_id"
  end

  create_table "slots", force: :cascade do |t|
    t.string "slot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "user_id"
    t.index ["user_id"], name: "index_slots_on_user_id"
  end

  create_table "titles", force: :cascade do |t|
    t.string "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "equipment_id"
    t.index ["equipment_id"], name: "index_titles_on_equipment_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "department"
    t.string "course"
    t.string "orgname"
    t.string "orgaddress"
    t.binary "collegeid"
    t.string "profession"
    t.string "rollno"
    t.string "contact"
    t.string "lastname"
    t.string "firstname"
    t.string "role"
    t.boolean "admin_role"
    t.boolean "chairman_role"
    t.boolean "user_role"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
