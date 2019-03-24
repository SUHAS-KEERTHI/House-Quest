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

ActiveRecord::Schema.define(version: 20181010135026) do

  create_table "companies", force: :cascade do |t|
    t.string "name", null: false
    t.string "website", null: false
    t.string "address", null: false
    t.string "year"
    t.string "revenue"
    t.string "size"
    t.text "synopsis"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_companies_on_user_id"
  end

  create_table "houses", force: :cascade do |t|
    t.string "location"
    t.integer "squareft"
    t.integer "yearbuilt"
    t.string "style"
    t.integer "listprice"
    t.integer "floors"
    t.boolean "basement"
    t.string "currentowner"
    t.string "realtorcontact"
    t.string "potentialbuyers"
    t.integer "companies_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["companies_id"], name: "index_houses_on_companies_id"
  end

  create_table "inquiries", force: :cascade do |t|
    t.integer "user_id"
    t.string "subject"
    t.string "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "user_email"
    t.string "realtor_email"
    t.string "reply"
    t.index ["user_id"], name: "index_inquiries_on_user_id"
  end

  create_table "searches", force: :cascade do |t|
    t.string "keywords"
    t.string "location"
    t.decimal "min_price"
    t.decimal "max_price"
    t.decimal "min_squarefoot"
    t.decimal "max_squarefoot"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "name"
    t.bigint "phone"
    t.string "contact_type"
    t.boolean "admin", default: false
    t.string "user_role"
    t.string "role_type"
    t.integer "company_id", default: 1
    t.string "provider"
    t.string "uid"
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

end
