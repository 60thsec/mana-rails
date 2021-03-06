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

ActiveRecord::Schema.define(version: 20150306220847) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "clients", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "phone"
    t.string   "short_code"
    t.string   "website"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
    t.integer  "account_manager_id"
  end

  add_index "clients", ["account_manager_id"], name: "index_clients_on_account_manager_id", using: :btree
  add_index "clients", ["short_code"], name: "index_clients_on_short_code", using: :btree

  create_table "comments", force: true do |t|
    t.string   "subject"
    t.text     "body"
    t.integer  "commenter_id"
    t.boolean  "is_public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "commentable_id"
    t.string   "commentable_type"
    t.string   "slug"
  end

  add_index "comments", ["commentable_id"], name: "index_comments_on_commentable_id", using: :btree
  add_index "comments", ["commenter_id"], name: "index_comments_on_commenter_id", using: :btree
  add_index "comments", ["slug"], name: "index_comments_on_slug", unique: true, using: :btree

  create_table "issues", force: true do |t|
    t.integer  "unique_id"
    t.string   "subject"
    t.text     "description"
    t.decimal  "projected_hours", default: 0.0
    t.datetime "due_date"
    t.integer  "project_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "issues", ["project_id"], name: "index_issues_on_project_id", using: :btree
  add_index "issues", ["unique_id"], name: "index_issues_on_unique_id", using: :btree

  create_table "memberships", force: true do |t|
    t.integer  "user_id"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "memberships_permissions", id: false, force: true do |t|
    t.integer "membership_id", null: false
    t.integer "permission_id", null: false
  end

  create_table "memberships_roles", id: false, force: true do |t|
    t.integer "membership_id", null: false
    t.integer "role_id",       null: false
  end

  create_table "permissions", force: true do |t|
    t.string   "klass"
    t.string   "action"
    t.text     "description"
    t.string   "condition"
    t.boolean  "is_public"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "role_id"
  end

  create_table "permissions_users", id: false, force: true do |t|
    t.integer "user_id",       null: false
    t.integer "permission_id", null: false
  end

  create_table "profiles", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "job_title"
    t.string   "phone"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "address"
    t.string   "secondary_phone"
    t.string   "time_zone"
    t.string   "twitter_name"
  end

  add_index "profiles", ["user_id"], name: "index_profiles_on_user_id", using: :btree

  create_table "projects", force: true do |t|
    t.string   "name"
    t.string   "short_code"
    t.text     "description"
    t.decimal  "projected_hours"
    t.datetime "due_date"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "team_id"
  end

  add_index "projects", ["client_id"], name: "index_projects_on_client_id", using: :btree
  add_index "projects", ["short_code"], name: "index_projects_on_short_code", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.string   "short_code"
    t.integer  "team_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles_users", id: false, force: true do |t|
    t.integer "user_id", null: false
    t.integer "role_id", null: false
  end

  create_table "teams", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
  end

  add_index "teams", ["name"], name: "index_teams_on_name", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_digest"
    t.integer  "client_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "api_key"
    t.string   "special_key"
    t.boolean  "admin"
    t.integer  "team_id"
    t.boolean  "verified"
    t.string   "status"
    t.boolean  "available"
  end

  add_index "users", ["client_id"], name: "index_users_on_client_id", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["name"], name: "index_users_on_name", unique: true, using: :btree
  add_index "users", ["special_key"], name: "index_users_on_special_key", using: :btree

end
