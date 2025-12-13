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

ActiveRecord::Schema.define(:version => 20150815211340) do

  create_table "agents", :force => true do |t|
    t.string   "name"
    t.integer  "mob_num"
    t.boolean  "available"
    t.integer  "max_emp_count"
    t.string   "preferred_location"
    t.decimal  "rating",             :precision => 10, :scale => 0
    t.integer  "experience"
    t.string   "password_digest"
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "preferred_employee"
  end

  create_table "companies", :force => true do |t|
    t.string   "name"
    t.string   "organisation"
    t.string   "organisation_type"
    t.string   "email"
    t.string   "password_digest"
    t.string   "address"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  create_table "jobposts", :force => true do |t|
    t.text     "job_description"
    t.datetime "job_start_date"
    t.datetime "job_end_date"
    t.string   "job_duration"
    t.string   "job_type"
    t.integer  "job_budget"
    t.integer  "employees_req"
    t.string   "job_location"
    t.integer  "company_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "mob_num"
    t.boolean  "available"
    t.string   "preferred_jobs"
    t.string   "password_digest"
    t.string   "preferred_location"
    t.decimal  "experience",         :precision => 10, :scale => 0
    t.decimal  "ratings",            :precision => 10, :scale => 0
    t.datetime "created_at",                                        :null => false
    t.datetime "updated_at",                                        :null => false
    t.string   "user_type"
    t.integer  "agent_id"
  end

end
