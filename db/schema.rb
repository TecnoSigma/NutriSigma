# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150304214517) do

  create_table "anamneses", force: :cascade do |t|
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.integer  "medical_register_id"
    t.time     "morning_meal_time"
    t.time     "noon_meal_time"
    t.time     "evening_meal_time"
    t.integer  "patient_id"
  end

  add_index "anamneses", ["patient_id"], name: "index_anamneses_on_patient_id"

  create_table "equivalent_foods", force: :cascade do |t|
    t.string   "food"
    t.integer  "quantity_measure"
    t.string   "measure"
    t.integer  "weight"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "group"
  end

  create_table "group_foods", force: :cascade do |t|
    t.string   "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "patient_id"
    t.string   "name"
    t.string   "email"
    t.string   "gender"
    t.integer  "age"
    t.float    "height"
    t.float    "weight"
  end

end
