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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20130324141142) do

  create_table "addresses", :force => true do |t|
    t.integer  "firm_id"
    t.string   "line_1"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "addresses", ["firm_id"], :name => "index_addresses_on_firm_id"

  create_table "categories", :force => true do |t|
    t.string   "name"
    t.string   "url"
    t.integer  "weight"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.string   "ancestry"
    t.string   "slug"
    t.integer  "ancestry_depth"
    t.integer  "firms_count",    :default => 0
  end

  add_index "categories", ["ancestry"], :name => "index_categories_on_ancestry"
  add_index "categories", ["slug"], :name => "index_categories_on_slug"

  create_table "firms", :force => true do |t|
    t.string   "name"
    t.text     "short_description"
    t.text     "description"
    t.integer  "user_id"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.string   "slug"
    t.integer  "category_id"
    t.string   "favatar"
  end

  add_index "firms", ["category_id"], :name => "index_firms_on_category_id"
  add_index "firms", ["slug"], :name => "index_firms_on_slug"

  create_table "galleries", :force => true do |t|
    t.string   "image"
    t.string   "title"
    t.string   "alt"
    t.integer  "weight"
    t.integer  "firm_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "galleries", ["firm_id"], :name => "index_galleries_on_firm_id"

  create_table "phones", :force => true do |t|
    t.string   "number"
    t.string   "number_type"
    t.integer  "address_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "phones", ["address_id"], :name => "index_phones_on_address_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "",    :null => false
    t.string   "encrypted_password",     :default => "",    :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
    t.string   "username"
    t.boolean  "admin",                  :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
