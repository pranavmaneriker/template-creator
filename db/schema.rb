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

ActiveRecord::Schema.define(:version => 20141126235158) do

  create_table "resume_data_values", :force => true do |t|
    t.integer  "resume_id"
    t.string   "field_name"
    t.string   "field_data"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "resume_data_values", ["field_name"], :name => "index_resume_data_on_field"
  add_index "resume_data_values", ["resume_id"], :name => "index_resume_data_on_resume_id"

  create_table "resume_relations", :force => true do |t|
    t.integer  "user_id"
    t.datetime "created_at",               :null => false
    t.datetime "updated_at",               :null => false
    t.string   "resume_filename"
    t.string   "resume_html_file_name"
    t.string   "resume_html_content_type"
    t.integer  "resume_html_file_size"
    t.datetime "resume_html_updated_at"
  end

  add_index "resume_relations", ["resume_filename"], :name => "index_resume_relations_on_resume_filename"
  add_index "resume_relations", ["user_id"], :name => "index_resume_relations_on_user_id"

  create_table "resumes_css_templates", :force => true do |t|
    t.string   "template_name"
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
    t.string   "template_file_file_name"
    t.string   "template_file_content_type"
    t.integer  "template_file_file_size"
    t.datetime "template_file_updated_at"
  end

  add_index "resumes_css_templates", ["template_name"], :name => "index_resumes_css_templates_on_template_name"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["remember_token"], :name => "index_users_on_remember_token"

end
