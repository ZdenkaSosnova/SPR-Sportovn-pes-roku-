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

ActiveRecord::Schema[7.1].define(version: 2024_04_09_161022) do
  create_table "dogs", force: :cascade do |t|
    t.string "dog_name"
    t.date "date_of_birth"
    t.integer "owner_id", null: false
    t.index ["owner_id"], name: "index_dogs_on_owner_id"
  end

  create_table "herdings", force: :cascade do |t|
    t.string "category"
    t.integer "points"
    t.integer "position"
    t.integer "num_dogs"
    t.integer "final_points"
    t.string "event_place"
    t.date "event_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "dog_id", null: false
    t.index ["dog_id"], name: "index_herdings_on_dog_id"
  end

  create_table "members", force: :cascade do |t|
    t.string "title"
    t.string "last_name"
    t.string "first_name"
    t.string "city"
    t.string "email"
    t.string "external_id"
  end

  create_table "owners", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.integer "member_id", null: false
    t.index ["member_id"], name: "index_owners_on_member_id"
  end

  add_foreign_key "dogs", "owners"
  add_foreign_key "herdings", "dogs"
  add_foreign_key "owners", "members"
end
