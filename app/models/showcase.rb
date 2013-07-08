class Showcase < ActiveRecord::Base
	belongs_to :venue
	attr_accessible :venue_id, :ord
end
