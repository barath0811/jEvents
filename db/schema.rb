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

ActiveRecord::Schema.define(:version => 20130707041958) do

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

  create_table "areas", :force => true do |t|
    t.string   "area1"
    t.string   "area2"
    t.decimal  "distance",   :precision => 10, :scale => 0
    t.datetime "created_at",                                :null => false
    t.datetime "updated_at",                                :null => false
  end

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
    t.datetime "created_at",                                    :null => false
    t.datetime "updated_at",                                    :null => false
    t.boolean  "airconditioning",            :default => false
    t.boolean  "audio_video_equipment",      :default => false
    t.boolean  "has_bar",                    :default => false
    t.boolean  "has_projector",              :default => false
    t.boolean  "has_stage",                  :default => false
    t.boolean  "has_smoking_area",           :default => false
    t.boolean  "has_wifi_or_internet",       :default => false
    t.boolean  "has_whiteboard",             :default => false
    t.boolean  "has_video_conference_phone", :default => false
    t.boolean  "has_dance_floor",            :default => false
  end

  add_index "facilities", ["venue_id"], :name => "index_facilities_on_venue_id"

  create_table "feedbacks", :force => true do |t|
    t.string   "name",          :null => false
    t.string   "email",         :null => false
    t.string   "subject",       :null => false
    t.text     "feedback",      :null => false
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
    t.string   "user_ip"
    t.datetime "feedback_date"
  end

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

  create_table "highlights", :force => true do |t|
    t.string   "highlight"
    t.decimal  "display_order", :precision => 10, :scale => 0
    t.datetime "created_at",                                   :null => false
    t.datetime "updated_at",                                   :null => false
    t.integer  "venue_id"
  end

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

  create_table "ratings", :force => true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.integer  "rating"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "ratings", ["user_id"], :name => "index_ratings_on_user_id"
  add_index "ratings", ["venue_id"], :name => "index_ratings_on_venue_id"

  create_table "reviews", :force => true do |t|
    t.integer  "user_id"
    t.integer  "venue_id"
    t.string   "review"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "reviews", ["user_id"], :name => "index_reviews_on_user_id"
  add_index "reviews", ["venue_id"], :name => "index_reviews_on_venue_id"

  create_table "roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "roles_users", :id => false, :force => true do |t|
    t.integer "role_id"
    t.integer "user_id"
  end

  create_table "seating_arrangements", :force => true do |t|
    t.integer  "hall_id"
    t.datetime "created_at",                         :null => false
    t.datetime "updated_at",                         :null => false
    t.integer  "capacity_theatre",    :default => 0
    t.integer  "capacity_ushape",     :default => 0
    t.integer  "capacity_doubleu",    :default => 0
    t.integer  "capacity_classroom",  :default => 0
    t.integer  "capacity_board",      :default => 0
    t.integer  "capacity_roundtable", :default => 0
  end

  add_index "seating_arrangements", ["hall_id"], :name => "index_seating_arrangements_on_hall_id"

  create_table "showcases", :id => false, :force => true do |t|
    t.integer "ord"
    t.integer "venue_id"
  end

  create_table "suitable_events", :force => true do |t|
    t.string   "name"
    t.integer  "venue_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.integer  "failed_attempts",        :default => 5
    t.string   "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "role"
  end

  add_index "users", ["confirmation_token"], :name => "index_users_on_confirmation_token", :unique => true
  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "venue_requests", :force => true do |t|
    t.string   "name",             :null => false
    t.string   "area",             :null => false
    t.string   "contact_mobile"
    t.string   "contact_landline"
    t.string   "email"
    t.string   "user_ip"
    t.integer  "user_id"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
    t.string   "contact_name"
  end

  add_index "venue_requests", ["user_id"], :name => "index_venue_requests_on_user_id"

  create_table "venues", :force => true do |t|
    t.string   "name"
    t.string   "venue_type"
    t.string   "website"
    t.text     "terms_conditions"
    t.datetime "created_at",                                                          :null => false
    t.datetime "updated_at",                                                          :null => false
    t.binary   "base_image"
    t.integer  "num_halls"
    t.integer  "min_capacity"
    t.integer  "max_capacity"
    t.integer  "user_id",                                                             :null => false
    t.decimal  "popularity_index",  :precision => 10, :scale => 0
    t.boolean  "view_available",                                   :default => false
    t.boolean  "booking_available",                                :default => false
    t.boolean  "enquiry_available",                                :default => false
    t.boolean  "is_approved",                                      :default => false
    t.string   "description"
    t.decimal  "rating",            :precision => 10, :scale => 0
    t.integer  "review_count"
  end

end
