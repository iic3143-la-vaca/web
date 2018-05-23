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

ActiveRecord::Schema.define(version: 2018_05_23_001926) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "addresses", force: :cascade do |t|
    t.string "apartment"
    t.string "country"
    t.integer "zip"
    t.string "street"
    t.integer "number"
    t.string "city"
    t.string "district"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_addresses_on_user_id"
  end

  create_table "bank_accounts", force: :cascade do |t|
    t.string "bank"
    t.string "account"
    t.string "rut"
    t.integer "type"
    t.bigint "user_id"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bank_accounts_on_user_id"
  end

  create_table "comments", force: :cascade do |t|
    t.bigint "user_id"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "project_id"
    t.index ["project_id"], name: "index_comments_on_project_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "donations", force: :cascade do |t|
    t.float "amount"
    t.integer "status"
    t.bigint "user_id"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_donations_on_project_id"
    t.index ["user_id"], name: "index_donations_on_user_id"
  end

  create_table "news", force: :cascade do |t|
    t.string "headline"
    t.string "lead"
    t.string "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.bigint "project_id"
    t.index ["project_id"], name: "index_news_on_project_id"
    t.index ["user_id"], name: "index_news_on_user_id"
  end

  create_table "project_tags", force: :cascade do |t|
    t.bigint "project_id"
    t.bigint "tag_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_project_tags_on_project_id"
    t.index ["tag_id"], name: "index_project_tags_on_tag_id"
  end

  create_table "projects", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.float "goal"
    t.integer "status"
    t.datetime "deadline"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "financing_description"
    t.text "creators_description"
    t.index ["user_id"], name: "index_projects_on_user_id"
  end

  create_table "rewards", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.float "lower_bound"
    t.float "upper_bound"
    t.boolean "dispatchable"
    t.bigint "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_rewards_on_project_id"
  end

  create_table "tags", force: :cascade do |t|
    t.string "tag"
    t.integer "color"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_rewards", force: :cascade do |t|
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "reward_id"
    t.index ["reward_id"], name: "index_user_rewards_on_reward_id"
    t.index ["user_id"], name: "index_user_rewards_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.integer "role"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "addresses", "users"
  add_foreign_key "bank_accounts", "users"
  add_foreign_key "comments", "projects"
  add_foreign_key "comments", "users"
  add_foreign_key "donations", "projects"
  add_foreign_key "donations", "users"
  add_foreign_key "news", "projects"
  add_foreign_key "news", "users"
  add_foreign_key "project_tags", "projects"
  add_foreign_key "project_tags", "tags"
  add_foreign_key "projects", "users"
  add_foreign_key "rewards", "projects"
  add_foreign_key "user_rewards", "rewards"
  add_foreign_key "user_rewards", "users"
end
