class Contact < ActiveRecord::Base

	attr_accessible :email, :firstname, :landline_number, :lastname, :mobile_number, :stdcode

	belongs_to :venue

	validates :firstname, :lastname, presence: true
	validates :email, presence: true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "is not a valid email" }
	validates :mobile_number, presence: true, :length => { :is => 10, :message => "should be exactly 10 characters" }
end
