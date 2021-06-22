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

ActiveRecord::Schema.define(version: 2021_06_19_143256) do

  create_table "divisions", force: :cascade do |t|
    t.string "name", null: false
    t.integer "parent_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["parent_id"], name: "index_divisions_on_parent_id"
  end

  create_table "employment_terms", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "division_id", null: false
    t.integer "position_id", null: false
    t.date "begin_date", null: false
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["division_id"], name: "index_employment_terms_on_division_id"
    t.index ["position_id"], name: "index_employment_terms_on_position_id"
    t.index ["user_id"], name: "index_employment_terms_on_user_id"
  end

  create_table "position_histories", force: :cascade do |t|
    t.string "name", null: false
    t.integer "position_id", null: false
    t.date "begin_date", null: false
    t.date "end_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["position_id"], name: "index_position_histories_on_position_id"
  end

  create_table "positions", force: :cascade do |t|
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "l_name", null: false
    t.string "f_name", null: false
    t.string "s_name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "employment_terms", "divisions"
  add_foreign_key "employment_terms", "positions"
  add_foreign_key "employment_terms", "users"
  add_foreign_key "position_histories", "positions"
end
