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

ActiveRecord::Schema.define(:version => 20130414212050) do

  create_table "calendar_events", :force => true do |t|
    t.date     "date",        :null => false
    t.text     "title",       :null => false
    t.text     "description", :null => false
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "guest_book_entries", :force => true do |t|
    t.string   "name",                          :null => false
    t.string   "email",                         :null => false
    t.string   "website"
    t.text     "content",                       :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
    t.boolean  "accepted",   :default => false, :null => false
  end

  create_table "members", :force => true do |t|
    t.string   "email",                  :default => "",       :null => false
    t.string   "encrypted_password",     :default => "",       :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "phone_number"
    t.string   "website"
    t.string   "membership",             :default => "member", :null => false
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.string   "avatar"
    t.string   "name",                                         :null => false
    t.date     "date_of_birth",                                :null => false
    t.date     "date_raised",                                  :null => false
    t.string   "address",                                      :null => false
    t.string   "employer"
    t.string   "title"
    t.string   "employment_time"
    t.string   "spouse_name"
    t.string   "first_child_name"
    t.string   "second_child_name"
    t.string   "third_child_name"
    t.string   "fourth_child_name"
  end

  add_index "members", ["email"], :name => "index_members_on_email", :unique => true
  add_index "members", ["reset_password_token"], :name => "index_members_on_reset_password_token", :unique => true

  create_table "sections", :force => true do |t|
    t.string   "section_name",    :null => false
    t.text     "section_content"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
