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

ActiveRecord::Schema.define(version: 20150223214357) do

  create_table "line_items", force: :cascade do |t|
    t.integer  "people_id"
    t.integer  "products_id"
    t.datetime "purchased_on"
    t.decimal  "false"
    t.integer  "quantity"
    t.decimal  "cost"
    t.datetime "deleted_at"
    t.datetime "true"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "person_id"
    t.integer  "product_id"
  end

  add_index "line_items", ["people_id"], name: "index_line_items_on_people_id"
  add_index "line_items", ["person_id"], name: "index_line_items_on_person_id"
  add_index "line_items", ["product_id"], name: "index_line_items_on_product_id"
  add_index "line_items", ["products_id"], name: "index_line_items_on_products_id"

  create_table "payments", force: :cascade do |t|
    t.integer  "people_id"
    t.decimal  "amount"
    t.date     "false"
    t.date     "paid_on"
    t.datetime "deleted_at"
    t.datetime "true"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "payments", ["people_id"], name: "index_payments_on_people_id"

  create_table "people", force: :cascade do |t|
    t.string   "first_name",   null: false
    t.string   "last_name",    null: false
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.datetime "destroyed_at"
  end

  create_table "products", force: :cascade do |t|
    t.string   "description",  null: false
    t.decimal  "cost",         null: false
    t.datetime "destroyed_at"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

end