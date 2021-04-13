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

ActiveRecord::Schema.define(version: 2021_04_13_113444) do

  create_table "brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "ブランドの管理", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "色の管理", force: :cascade do |t|
    t.string "name", null: false
    t.string "background_color", null: false
  end

  create_table "item_brands", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "アイテムとブランドの中間テーブル", force: :cascade do |t|
    t.integer "accessory_id"
    t.integer "brand_id"
  end

  create_table "item_colors", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "アイテムとカラーの中間テーブル", force: :cascade do |t|
    t.integer "other_id"
    t.integer "color_id"
  end

  create_table "item_seasons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "アイテムと季節の中間テーブル", force: :cascade do |t|
    t.integer "other_id"
    t.integer "season_id"
  end

  create_table "items", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "アイテムの管理", force: :cascade do |t|
    t.string "image", null: false
    t.datetime "purchase_date", null: false
    t.integer "prefecture_id"
    t.integer "parts_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "deleted_at"
  end

  create_table "seasons", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "季節の管理", force: :cascade do |t|
    t.string "name", null: false
    t.string "background_color", null: false
  end

  create_table "users", options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "user情報の管理", force: :cascade do |t|
    t.string "name", null: false
    t.string "email", null: false
    t.string "password_digest", null: false
    t.string "icon-image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
