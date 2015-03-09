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

ActiveRecord::Schema.define(version: 20150309024537) do

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
    t.integer  "group"
    t.float    "quantity_measure"
    t.string   "measure"
    t.float    "weight"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "food_groups", force: :cascade do |t|
    t.string   "group"
    t.float    "carbohydrate"
    t.float    "proteins"
    t.float    "lipids"
    t.float    "kilocalories"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  create_table "nutritionist_profiles", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "issuing_institution"
    t.string   "crn_number"
    t.date     "crn_expiration"
    t.string   "license_type"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  create_table "nutritionists", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "nutritionists", ["email"], name: "index_nutritionists_on_email", unique: true
  add_index "nutritionists", ["reset_password_token"], name: "index_nutritionists_on_reset_password_token", unique: true

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
