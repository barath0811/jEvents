class VenueRequest < ActiveRecord::Base
	belongs_to :user
	attr_accessible :area, :contact_landline, :contact_mobile, :email, :name, :user_ip, :contact_name

	validates :area, :presence => true
	validates :name, :presence => true
	validates :contact_name, :presence => true
	validates :email, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "is not a valid email" }
	validates :contact_mobile, :presence => true
end