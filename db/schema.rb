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

ActiveRecord::Schema.define(version: 20160929193816) do

  create_table "invoices", force: :cascade do |t|
    t.date     "date"
    t.integer  "operator_id"
    t.string   "invoice_type"
    t.integer  "sales_point"
    t.integer  "number"
    t.integer  "taxed_21_cents",  default: 0
    t.integer  "taxed_105_cents", default: 0
    t.integer  "not_taxed_cents", default: 0
    t.integer  "exempt_cents",    default: 0
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "invoices", ["operator_id"], name: "index_invoices_on_operator_id"

  create_table "movements", force: :cascade do |t|
    t.integer  "monto"
    t.integer  "reserva_id"
    t.string   "type"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "operator_id"
  end

  add_index "movements", ["reserva_id"], name: "index_movements_on_reserva_id"

  create_table "operators", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "type"
    t.string   "cuit"
    t.string   "address"
    t.string   "phone"
    t.string   "tax_category"
    t.string   "file_number"
  end

  create_table "passengers", force: :cascade do |t|
    t.string   "name"
    t.string   "documento"
    t.date     "nacimiento"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reservas", force: :cascade do |t|
    t.date     "salida"
    t.string   "hotel"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "wholesaler_id"
    t.integer  "retailer_id"
    t.integer  "amount_cents",    default: 0
    t.string   "amount_currency"
  end

  create_table "trips", force: :cascade do |t|
    t.integer  "reserva_id"
    t.integer  "passenger_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "trips", ["passenger_id"], name: "index_trips_on_passenger_id"
  add_index "trips", ["reserva_id"], name: "index_trips_on_reserva_id"

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
