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

ActiveRecord::Schema.define(version: 20220726211830) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "enrollments", force: :cascade do |t|
    t.decimal "total_value", precision: 8, scale: 2, null: false
    t.integer "number_invoices", null: false
    t.integer "invoice_due_date", null: false
    t.bigint "institution_id", null: false
    t.bigint "student_id", null: false
    t.index ["institution_id"], name: "index_enrollments_on_institution_id"
    t.index ["student_id"], name: "index_enrollments_on_student_id"
  end

  create_table "institutions", force: :cascade do |t|
    t.string "name", limit: 600, null: false
    t.string "cnpj", limit: 18, null: false
    t.string "kind", limit: 12
  end

  create_table "invoices", force: :cascade do |t|
    t.integer "invoice_amount", null: false
    t.date "due_date", null: false
    t.bigint "enrollment_id", null: false
    t.string "status", null: false
    t.index ["enrollment_id"], name: "index_invoices_on_enrollment_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name", limit: 200, null: false
    t.string "cpf", limit: 11, null: false
    t.date "birth_date"
    t.bigint "tel"
    t.string "genere", limit: 1, null: false
    t.string "payment_method", limit: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "authentication_token", limit: 30
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "enrollments", "institutions"
  add_foreign_key "enrollments", "students"
  add_foreign_key "invoices", "enrollments"
end
