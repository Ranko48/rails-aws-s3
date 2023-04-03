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

ActiveRecord::Schema.define(version: 2023_04_03_215341) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_articles_on_user_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.date "date"
    t.string "location"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fight_participants", force: :cascade do |t|
    t.bigint "fight_id", null: false
    t.bigint "fighter_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["fight_id"], name: "index_fight_participants_on_fight_id"
    t.index ["fighter_id"], name: "index_fight_participants_on_fighter_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.float "weight"
    t.string "city_of_origin"
    t.string "club"
    t.string "professional_record"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fights", force: :cascade do |t|
    t.bigint "fighter1_id"
    t.bigint "fighter2_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "event_id", null: false
    t.string "weight_class"
    t.boolean "finished"
    t.index ["event_id"], name: "index_fights_on_event_id"
    t.index ["fighter1_id"], name: "index_fights_on_fighter1_id"
    t.index ["fighter2_id"], name: "index_fights_on_fighter2_id"
  end

  create_table "photos", force: :cascade do |t|
    t.string "photo"
    t.bigint "article_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["article_id"], name: "index_photos_on_article_id"
    t.index ["user_id"], name: "index_photos_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "articles", "users"
  add_foreign_key "fight_participants", "fighters"
  add_foreign_key "fight_participants", "fights"
  add_foreign_key "fights", "events"
  add_foreign_key "fights", "fighters", column: "fighter1_id"
  add_foreign_key "fights", "fighters", column: "fighter2_id"
  add_foreign_key "photos", "articles"
  add_foreign_key "photos", "users"
end
