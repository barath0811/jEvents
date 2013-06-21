class Feedback < ActiveRecord::Base
	attr_accessible :email, :feedback, :name, :subject

  	#validations
  	validates :name, :presence => true
  	validates :email, :presence => true, :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i, :message => "is not a valid email" }
  	validates :subject, :presence => true
  	validates :feedback, :presence => true
end
