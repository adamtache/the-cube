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

ActiveRecord::Schema.define(version: 20131230200138) do

  create_table "active_admin_comments", force: true do |t|
    t.string   "namespace"
    t.text     "body"
    t.string   "resource_id",   null: false
    t.string   "resource_type", null: false
    t.integer  "author_id"
    t.string   "author_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"

  create_table "admin_users", force: true do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_hash"
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true

  create_table "companies", force: true do |t|
    t.string   "name"
    t.date     "founded_at"
    t.text     "blurb"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "companies_members", force: true do |t|
    t.integer "company_id"
    t.integer "member_id"
  end

  add_index "companies_members", ["company_id"], name: "index_companies_members_on_company_id"
  add_index "companies_members", ["member_id"], name: "index_companies_members_on_member_id"

  create_table "companies_posts", force: true do |t|
    t.integer "company_id"
    t.integer "post_id"
  end

  add_index "companies_posts", ["company_id"], name: "index_companies_posts_on_company_id"
  add_index "companies_posts", ["post_id"], name: "index_companies_posts_on_post_id"

  create_table "members", force: true do |t|
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "email_hash"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "alumni",     default: false
  end

  create_table "members_posts", force: true do |t|
    t.integer "member_id"
    t.integer "post_id"
  end

  add_index "members_posts", ["member_id"], name: "index_members_posts_on_member_id"
  add_index "members_posts", ["post_id"], name: "index_members_posts_on_post_id"

  create_table "posts", force: true do |t|
    t.string   "heading"
    t.text     "markdown_content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "admin_user_id"
    t.boolean  "pinned",           default: false
    t.text     "html_content"
  end

  add_index "posts", ["admin_user_id"], name: "index_posts_on_admin_user_id"

end
