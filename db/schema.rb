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

ActiveRecord::Schema.define(version: 20171218100347) do

  create_table "families", force: :cascade do |t|
    t.integer "member_id"
    t.integer "separately"
    t.string "relationship"
    t.string "lastname"
    t.string "firstname"
    t.string "name"
    t.string "namekana"
    t.date "birthday"
    t.string "postal"
    t.string "city"
    t.string "streetaddress"
    t.text "note"
    t.boolean "dm", default: false, null: false
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_families_on_member_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ledgers", force: :cascade do |t|
    t.string "class"
    t.string "kind"
    t.string "responsible"
    t.string "deceased"
    t.string "coffin"
    t.text "other"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "members", force: :cascade do |t|
    t.string "lastname"
    t.string "firstname"
    t.string "name"
    t.string "namekana"
    t.integer "gender"
    t.date "birthday"
    t.string "postal"
    t.string "city"
    t.string "streetaddress"
    t.string "tel"
    t.string "mobile"
    t.string "sect"
    t.string "kind"
    t.boolean "local", default: false, null: false
    t.boolean "reserve", default: false, null: false
    t.boolean "dm", default: false, null: false
    t.text "tag"
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "relationships", force: :cascade do |t|
    t.integer "member_id"
    t.integer "member2_id"
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member2_id"], name: "index_relationships_on_member2_id"
    t.index ["member_id", "member2_id"], name: "index_relationships_on_member_id_and_member2_id", unique: true
    t.index ["member_id"], name: "index_relationships_on_member_id"
  end

  create_table "remarks", force: :cascade do |t|
    t.date "date"
    t.text "content"
    t.integer "member_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["member_id"], name: "index_remarks_on_member_id"
  end

  create_table "sects", force: :cascade do |t|
    t.string "sect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "loginid"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
