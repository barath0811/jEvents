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

ActiveRecord::Schema.define(:version => 20130525101751) do

  create_table "addresses", :force => true do |t|
    t.string   "Address",      :null => false
    t.string   "Landmark"
    t.string   "Location",     :null => false
    t.string   "PhoneNumbers", :null => false
    t.integer  "Venue_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "addresses", ["Venue_id"], :name => "index_addresses_on_Venue_id"

  create_table "amenities", :force => true do |t|
    t.boolean  "IsCarParkingAvailable"
    t.boolean  "IsRestaurantAvailable"
    t.boolean  "IsAlcoholAllowed"
    t.boolean  "IsCreditCardAccepted"
    t.boolean  "IsExternalCateringAllowed"
    t.boolean  "IsNonVegAllowed"
    t.integer  "Venue_id"
    t.datetime "created_at",                :null => false
    t.datetime "updated_at",                :null => false
  end

  add_index "amenities", ["Venue_id"], :name => "index_amenities_on_Venue_id"

  create_table "events", :force => true do |t|
    t.string   "EventType"
    t.integer  "Venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "events", ["Venue_id"], :name => "index_events_on_Venue_id"

  create_table "halls", :force => true do |t|
    t.integer  "Venue_id"
    t.string   "Name"
    t.integer  "Capacity"
    t.string   "HallType"
    t.integer  "Statistics_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "halls", ["Statistics_id"], :name => "index_halls_on_Statistics_id"
  add_index "halls", ["Venue_id"], :name => "index_halls_on_Venue_id"

  create_table "meal_infos", :force => true do |t|
    t.string   "Food",                                                     :null => false
    t.decimal  "VegBuffetPricePerPlate",    :precision => 10, :scale => 0
    t.decimal  "NonVegBuffetPricePerPlate", :precision => 10, :scale => 0
    t.datetime "created_at",                                               :null => false
    t.datetime "updated_at",                                               :null => false
  end

  create_table "statistics", :force => true do |t|
    t.decimal  "OverallRating",   :precision => 10, :scale => 0
    t.decimal  "PopularityIndex", :precision => 10, :scale => 0
    t.integer  "NumViewers"
    t.integer  "NumEnquiries"
    t.integer  "NumBookings"
    t.integer  "Venue_id"
    t.integer  "EventHall_id"
    t.datetime "created_at",                                     :null => false
    t.datetime "updated_at",                                     :null => false
  end

  add_index "statistics", ["EventHall_id"], :name => "index_statistics_on_EventHall_id"
  add_index "statistics", ["Venue_id"], :name => "index_statistics_on_Venue_id"

  create_table "users", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "venues", :force => true do |t|
    t.string   "Name",                         :null => false
    t.string   "Type",                         :null => false
    t.integer  "NumHalls",      :default => 1, :null => false
    t.integer  "Address_id"
    t.integer  "MealInfo_id"
    t.integer  "Amenities_id"
    t.integer  "Statistics_id"
    t.datetime "created_at",                   :null => false
    t.datetime "updated_at",                   :null => false
  end

  add_index "venues", ["Address_id"], :name => "index_venues_on_Address_id"
  add_index "venues", ["Amenities_id"], :name => "index_venues_on_Amenities_id"
  add_index "venues", ["MealInfo_id"], :name => "index_venues_on_MealInfo_id"
  add_index "venues", ["Statistics_id"], :name => "index_venues_on_Statistics_id"

end
