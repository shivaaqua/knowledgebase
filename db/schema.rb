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

ActiveRecord::Schema.define(:version => 20120907153120) do

  create_table "comments", :force => true do |t|
    t.integer  "user_id",                       :null => false
    t.integer  "snippet_id",                    :null => false
    t.text     "comment",                       :null => false
    t.boolean  "question",    :default => true, :null => false
    t.integer  "question_id"
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "comments", ["question", "question_id"], :name => "index_comments_on_question_and_question_id"
  add_index "comments", ["snippet_id", "user_id"], :name => "index_comments_on_snippet_id_and_user_id"

  create_table "snippet_details", :force => true do |t|
    t.integer  "snippet_id",         :null => false
    t.text     "detail",             :null => false
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "video_file_name"
    t.string   "video_content_type"
    t.integer  "video_file_size"
    t.datetime "video_updated_at"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "snippet_details", ["snippet_id"], :name => "index_snippet_details_on_snippet_id"

  create_table "snippet_types", :force => true do |t|
    t.string   "name",        :limit => 20,  :null => false
    t.string   "description", :limit => 250, :null => false
    t.datetime "created_at",                 :null => false
    t.datetime "updated_at",                 :null => false
  end

  add_index "snippet_types", ["name"], :name => "index_snippet_types_on_name", :unique => true

  create_table "snippets", :force => true do |t|
    t.string   "title",           :limit => 50, :null => false
    t.integer  "snippet_type_id",               :null => false
    t.text     "description",                   :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "snippets", ["title", "snippet_type_id"], :name => "index_snippets_on_title_and_snippet_type_id", :unique => true

end