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

ActiveRecord::Schema.define(version: 20150730184646) do

  create_table "bootsy_image_galleries", force: :cascade do |t|
    t.integer  "bootsy_resource_id"
    t.string   "bootsy_resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "bootsy_images", force: :cascade do |t|
    t.string   "image_file"
    t.integer  "image_gallery_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies", force: :cascade do |t|
    t.string   "company_type"
    t.string   "company_name"
    t.text     "about"
    t.string   "website"
    t.integer  "user_id"
    t.string   "photo"
    t.boolean  "is_payed"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.string   "specialization"
  end

  add_index "companies", ["user_id"], name: "index_companies_on_user_id"

  create_table "companies_users", id: false, force: :cascade do |t|
    t.integer "company_id"
    t.integer "user_id"
  end

  create_table "company_vacancies", force: :cascade do |t|
    t.integer  "company_id"
    t.string   "title"
    t.float    "salary"
    t.text     "requirements"
    t.text     "description"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "company_vacancies", ["company_id"], name: "index_company_vacancies_on_company_id"

  create_table "events", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "from"
    t.datetime "to"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "events", ["company_id"], name: "index_events_on_company_id"
  add_index "events", ["user_id"], name: "index_events_on_user_id"

  create_table "news", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.boolean  "published"
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "news", ["company_id"], name: "index_news_on_company_id"
  add_index "news", ["user_id"], name: "index_news_on_user_id"

  create_table "owners", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "owners", ["user_id"], name: "index_owners_on_user_id"

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
  add_index "roles", ["name"], name: "index_roles_on_name"

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "provider"
    t.string   "uid"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "role"
    t.integer  "company_id"
    t.string   "email"
  end

  create_table "users_roles", id: false, force: :cascade do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id"

end
