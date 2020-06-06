# typed: strict
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

ActiveRecord::Schema.define(version: 2020_06_03_191622) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.float "total_co2_produced", default: 0.0
    t.float "total_co2_captured", default: 0.0
    t.index ["name"], name: "index_companies_on_name", unique: true
  end

  create_table "company_tasks", force: :cascade do |t|
    t.integer "percent_done", default: 0
    t.bigint "company_id", null: false
    t.bigint "task_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_tasks_on_company_id"
    t.index ["task_id"], name: "index_company_tasks_on_task_id"
  end

  create_table "company_years", force: :cascade do |t|
    t.bigint "company_id", null: false
    t.bigint "year_id", null: false
    t.float "co2_produced", default: 0.0
    t.float "co2_captured", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_company_years_on_company_id"
    t.index ["year_id"], name: "index_company_years_on_year_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "universal"
    t.index ["name"], name: "index_tasks_on_name"
  end

  create_table "years", force: :cascade do |t|
    t.integer "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["name"], name: "index_years_on_name"
  end

  add_foreign_key "company_tasks", "companies"
  add_foreign_key "company_tasks", "tasks"
  add_foreign_key "company_years", "companies"
  add_foreign_key "company_years", "years"
end
