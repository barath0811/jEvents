class HomeController < ApplicationController
	helper :venues
	
	def index
		showcases = Showcase.get_venues
		@images = Image.where(venue_id: showcases)
	end
end
