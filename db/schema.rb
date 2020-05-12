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

ActiveRecord::Schema.define(version: 2020_05_12_184921) do

  create_table "cars", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "car_id"
    t.string "car_model"
    t.boolean "autopilot"
    t.string "paint"
    t.string "interior_decor"
    t.string "roof"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_s_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "car_id"
    t.integer "car_price"
  end

  create_table "model_three_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "car_id"
    t.integer "car_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "model_x_data", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", force: :cascade do |t|
    t.string "car_id"
    t.integer "car_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end