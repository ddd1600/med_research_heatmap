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

ActiveRecord::Schema.define(:version => 20130319223015) do

  create_table "data_rows", :force => true do |t|
    t.string   "name"
    t.float    "x_var"
    t.float    "y_var"
    t.integer  "spreadsheet_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.float    "z_var"
    t.float    "a_var"
    t.string   "b_var"
    t.string   "c_var"
  end

  add_index "data_rows", ["spreadsheet_id"], :name => "index_data_rows_on_spreadsheet_id"

  create_table "readings", :force => true do |t|
    t.string   "drug_name"
    t.float    "result"
    t.text     "notes"
    t.integer  "test_id"
    t.integer  "subject_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "readings", ["subject_id"], :name => "index_readings_on_subject_id"
  add_index "readings", ["test_id"], :name => "index_readings_on_test_id"

  create_table "spreadsheets", :force => true do |t|
    t.string   "name"
    t.string   "x_var_name"
    t.string   "y_var_name"
    t.text     "source"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "z_var_name"
    t.string   "a_var_name"
    t.string   "b_var_name"
    t.string   "c_var_name"
    t.integer  "user_id"
  end

  create_table "subjects", :force => true do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "reading_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subjects", ["reading_id"], :name => "index_subjects_on_reading_id"

  create_table "tests", :force => true do |t|
    t.integer  "user_id"
    t.string   "name"
    t.date     "date"
    t.text     "notes"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "tests", ["user_id"], :name => "index_tests_on_user_id"

  create_table "tests_subjects", :id => false, :force => true do |t|
    t.integer "test_id"
    t.integer "subject_id"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "name"
    t.string   "password_digest"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
