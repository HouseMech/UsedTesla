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

ActiveRecord::Schema.define(version: 2020_06_14_173724) do

  create_table "vehicle_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.integer "price"
    t.integer "vehicle_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "data_acquired"
  end

  create_table "vehicles", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "vin"
    t.string "model"
    t.boolean "autopilot"
    t.string "paint"
    t.string "interior_decor"
    t.string "roof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "tires"
    t.float "acceleration_time"
    t.integer "top_speed"
    t.integer "battery_range"
    t.string "vehicle_history"
    t.string "full_model_name"
    t.string "trim_name"
    t.boolean "sold"
    t.date "sold_date"
    t.json "option_code_list"
  end

end
