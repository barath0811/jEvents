class Showcase < ActiveRecord::Base
	belongs_to :venue
	attr_accessible :venue_id, :ord

	def self.maxcount
		5
	end

	def self.get_venues
		venues = Showcase.pluck(:venue_id) || Array.new
		if venues.count < maxcount
			others = Image.pluck(:venue_id).sample(maxcount)
			others.each { |v| venues << v unless venues.include? v }
		end
		
		venues.sample(maxcount)
	end
end
