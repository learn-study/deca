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

ActiveRecord::Schema.define(version: 20180125155918) do

  create_table "altaritems", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "altar_id"
    t.integer "item_id"
    t.integer "quantity"
    t.integer "price"
    t.integer "amount"
    t.integer "taxation_id"
    t.integer "cost"
    t.integer "total_cost"
    t.integer "cost_taxation_id"
    t.boolean "ordering"
    t.datetime "derivery_date"
    t.integer "method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["altar_id"], name: "index_altaritems_on_altar_id"
  end

  create_table "altars", force: :cascade do |t|
    t.integer "member_id"
    t.string "applicantlastname"
    t.string "applicantfirstname"
    t.string "applicantkana"
    t.string "classification"
    t.string "employee_id"
    t.datetime "orderdate"
    t.string "deceased"
    t.string "city"
    t.string "streetaddress"
    t.datetime "ddate"
    t.string "pardon"
    t.string "popular"
    t.string "line"
    t.string "temple_id"
    t.string "sect_id"
    t.string "tel"
    t.string "mobile"
    t.integer "collection_id"
    t.text "other"
    t.integer "total_fee"
    t.integer "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buddhistmemorials", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "buddhistsermons", force: :cascade do |t|
    t.integer "member_id"
    t.string "applicantlastname"
    t.string "applicantfirstname"
    t.string "applicantkana"
    t.string "classification"
    t.string "employee_id"
    t.integer "bdmemorial_id"
    t.datetime "orderdate"
    t.string "deceased"
    t.string "city"
    t.string "streetaddress"
    t.string "tel"
    t.string "mobile"
    t.datetime "ddate"
    t.string "pardon"
    t.string "popular"
    t.string "temple_id"
    t.string "sect_id"
    t.datetime "bdmemorialdate"
    t.datetime "visitingtime"
    t.datetime "diningtime"
    t.string "bdmemorialplace"
    t.string "bdmemorial_city"
    t.string "bdmemorial_address"
    t.string "bdmemorial_tel"
    t.datetime "postcard"
    t.integer "set"
    t.integer "setnumber"
    t.integer "altar"
    t.string "altardetails"
    t.integer "drink"
    t.string "drinkdetails"
    t.integer "dues"
    t.integer "collection_id"
    t.text "other"
    t.integer "total_fee"
    t.integer "total_cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ceremonialplaces", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "tel"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "costs", force: :cascade do |t|
    t.string "item"
    t.integer "quantity"
    t.integer "price"
    t.integer "total"
    t.string "supplier"
    t.integer "ledger_id"
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ledger_id"], name: "index_costs_on_ledger_id"
  end

  create_table "deliverables", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "report_id"
    t.integer "item_id"
    t.integer "quantity"
    t.integer "price"
    t.integer "amount"
    t.integer "taxation_id"
    t.integer "cost"
    t.integer "total_cost"
    t.integer "cost_taxation_id"
    t.boolean "ordering"
    t.datetime "derivery_date"
    t.integer "method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["report_id"], name: "index_deliverables_on_report_id"
  end

  create_table "deliverymethods", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "destinations", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "earnings", force: :cascade do |t|
    t.string "item"
    t.integer "quantity"
    t.integer "price"
    t.integer "total"
    t.string "taxclass"
    t.integer "ledger_id"
    t.integer "row_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ledger_id"], name: "index_earnings_on_ledger_id"
  end

  create_table "employees", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "enforcements", force: :cascade do |t|
    t.string "family_name"
    t.integer "member_id"
    t.string "classification"
    t.string "applicantlastname"
    t.string "applicantfirstname"
    t.string "applicantname"
    t.string "applicantkana"
    t.integer "kind_id"
    t.integer "employee_id"
    t.string "deceased"
    t.datetime "birthday"
    t.datetime "ddate"
    t.string "cliefmaster"
    t.string "relationship"
    t.string "constructor"
    t.string "city"
    t.string "streetaddress"
    t.string "tel"
    t.string "mobile"
    t.integer "plan"
    t.integer "total"
    t.datetime "wake"
    t.datetime "funeral"
    t.datetime "coffin"
    t.string "ceremonial_id"
    t.integer "royarity"
    t.integer "burdon"
    t.string "ucosts"
    t.integer "temple_id"
    t.integer "number_of_pepole"
    t.integer "letter_price"
    t.integer "letter_quantity"
    t.integer "letter_supplier_id"
    t.integer "refreshment_price"
    t.integer "refreshment_quantity"
    t.integer "refreshment_supplier_id"
    t.integer "refreshment_product_id"
    t.integer "gift_price"
    t.integer "gift_quantity"
    t.integer "gift_supplier_id"
    t.integer "gift_product_id"
    t.integer "nightwear_price"
    t.integer "nightwear_quantity"
    t.integer "nightwear_supplier_id"
    t.integer "bus_price"
    t.integer "bus_quantity"
    t.integer "bus_supplier_id"
    t.integer "meal_supplier_id"
    t.string "r_bus"
    t.text "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

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

  create_table "items", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "item_id"
    t.string "name"
    t.integer "sell"
    t.integer "cost"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["supplier_id"], name: "index_items_on_supplier_id"
  end

  create_table "kinds", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ledgers", force: :cascade do |t|
    t.string "applicantlastname"
    t.string "applicantfirstname"
    t.string "applicantkana"
    t.string "applicantname"
    t.string "classification"
    t.integer "kind_id"
    t.string "employee_id"
    t.string "deceased"
    t.date "coffin"
    t.text "other"
    t.integer "member_id"
    t.integer "total_cost"
    t.integer "total_amount"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "meals", force: :cascade do |t|
    t.integer "enforcement_id"
    t.string "item"
    t.integer "number"
    t.integer "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enforcement_id"], name: "index_meals_on_enforcement_id"
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

  create_table "memorialitems", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "buddhistsermon_id"
    t.integer "item_id"
    t.integer "quantity"
    t.integer "price"
    t.integer "amount"
    t.integer "taxation_id"
    t.integer "cost"
    t.integer "total_cost"
    t.integer "cost_taxation_id"
    t.boolean "ordering"
    t.datetime "derivery_date"
    t.integer "method_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["buddhistsermon_id"], name: "index_memorialitems_on_buddhistsermon_id"
  end

  create_table "officers", force: :cascade do |t|
    t.integer "supplier_id"
    t.integer "enforcement_id"
    t.integer "receptionist"
    t.integer "accounting"
    t.integer "reception"
    t.integer "moderator"
    t.integer "parking"
    t.integer "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["enforcement_id"], name: "index_officers_on_enforcement_id"
    t.index ["supplier_id"], name: "index_officers_on_supplier_id"
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

  create_table "reports", force: :cascade do |t|
    t.integer "member_id"
    t.string "applicantlastname"
    t.string "applicantfirstname"
    t.string "applicantkana"
    t.string "classification"
    t.string "employee_id"
    t.datetime "orderdate"
    t.datetime "deliverydate"
    t.datetime "payment"
    t.string "deceased"
    t.string "city"
    t.string "streetaddress"
    t.string "tel"
    t.string "mobile"
    t.integer "collection_id"
    t.integer "total_fee"
    t.integer "total_cost"
    t.text "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservations", force: :cascade do |t|
    t.date "date"
    t.integer "member_id"
    t.string "classification"
    t.string "applicantlastname"
    t.string "applicantfirstname"
    t.string "applicantname"
    t.string "applicantkana"
    t.string "lastname"
    t.string "firstname"
    t.string "name"
    t.string "namekana"
    t.string "city"
    t.string "streetadress"
    t.string "relation"
    t.string "hospital"
    t.string "ceremonial1"
    t.string "ceremonial2"
    t.string "ceremonial3"
    t.string "plan"
    t.string "lower"
    t.string "other"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sects", force: :cascade do |t|
    t.string "sect"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "suppliers", force: :cascade do |t|
    t.string "name"
    t.integer "tax"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "taxations", force: :cascade do |t|
    t.string "text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "temples", force: :cascade do |t|
    t.string "name"
    t.string "address"
    t.string "tel"
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
