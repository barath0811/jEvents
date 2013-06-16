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

ActiveRecord::Schema.define(:version => 20130616113815) do

  create_table "addresses", :force => true do |t|
    t.integer  "venue_id"
    t.string   "address"
    t.string   "area"
    t.string   "landmark"
    t.string   "phone_numbers"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "addresses", ["venue_id"], :name => "index_addresses_on_venue_id"

  create_table "contacts", :force => true do |t|
    t.integer  "venue_id"
    t.string   "firstname"
    t.string   "lastname"
    t.string   "email"
    t.string   "stdcode"
    t.string   "landline_number"
    t.string   "mobile_number"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "contacts", ["venue_id"], :name => "index_contacts_on_venue_id"

  create_table "facilities", :force => true do |t|
    t.integer  "venue_id"
    t.boolean  "has_parking"
    t.boolean  "has_buffet"
    t.boolean  "is_alcohol_allowed"
    t.boolean  "is_nonveg_allowed"
    t.datetime "created_at",         :null => false
    t.datetime "updated_at",         :null => false
  end

  add_index "facilities", ["venue_id"], :name => "index_facilities_on_venue_id"

  create_table "halls", :force => true do |t|
    t.integer  "venue_id"
    t.string   "name"
    t.string   "hall_type"
    t.string   "pricing_mode"
    t.decimal  "hall_rent",    :precision => 10, :scale => 0
    t.datetime "created_at",                                  :null => false
    t.datetime "updated_at",                                  :null => false
  end

  add_index "halls", ["venue_id"], :name => "index_halls_on_venue_id"

  create_table "images", :force => true do |t|
    t.integer  "venue_id"
    t.integer  "hall_id"
    t.binary   "image"
    t.string   "caption"
    t.boolean  "can_showcase"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "images", ["hall_id"], :name => "index_images_on_hall_id"
  add_index "images", ["venue_id"], :name => "index_images_on_venue_id"

  create_table "rates", :force => true do |t|
    t.integer  "venue_id"
    t.decimal  "veg_plate_cost",    :precision => 10, :scale => 0
    t.decimal  "nonveg_plate_cost", :precision => 10, :scale => 0
    t.decimal  "min_total_budget",  :precision => 10, :scale => 0
    t.decimal  "max_total_budget",  :precision => 10, :scale => 0
    t.datetime "created_at",                                       :null => false
    t.datetime "updated_at",                                       :null => false
  end

  add_index "rates", ["venue_id"], :name => "index_rates_on_venue_id"

  create_table "seating_arrangements", :force => true do |t|
    t.integer  "hall_id"
    t.string   "arrangement_type"
    t.integer  "capacity"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  add_index "seating_arrangements", ["hall_id"], :name => "index_seating_arrangements_on_hall_id"

  create_table "suittable_events", :force => true do |t|
    t.string   "name"
    t.integer  "venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "venue_type"
    t.string   "website"
    t.text     "terms_conditions"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.binary   "base_image"
    t.integer  "num_halls"
    t.integer  "min_capacity"
    t.integer  "max_capacity"
  end

end
