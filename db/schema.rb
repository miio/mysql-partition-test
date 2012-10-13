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

ActiveRecord::Schema.define(:version => 20121013061604) do

  create_table "no_part_items", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.integer  "item_id",    :null => false
    t.datetime "deleted_at"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "no_part_items", ["deleted_at"], :name => "index_no_part_items_on_deleted_at"
  add_index "no_part_items", ["user_id"], :name => "index_no_part_items_on_user_id"

  create_table "part_range_items", :id => false, :force => true do |t|
    t.integer  "id",         :null => false
    t.integer  "user_id",    :null => false
    t.integer  "item_id",    :null => false
    t.datetime "deleted_at", :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "part_range_items", ["deleted_at"], :name => "index_part_range_items_on_deleted_at"
  add_index "part_range_items", ["user_id"], :name => "index_part_range_items_on_user_id"

  create_table "part_two_items", :id => false, :force => true do |t|
    t.integer  "id",                            :null => false
    t.integer  "user_id",                       :null => false
    t.integer  "item_id",                       :null => false
    t.boolean  "is_deleted", :default => false, :null => false
    t.datetime "created_at",                    :null => false
    t.datetime "updated_at",                    :null => false
  end

  add_index "part_two_items", ["is_deleted"], :name => "index_part_two_items_on_is_deleted"
  add_index "part_two_items", ["user_id"], :name => "index_part_two_items_on_user_id"

end
