class SearchCriteria
	attr_accessor :areas, :mealOptions, :capacity, 
	:budget, :amenities_name, :amenities_val, :rating, :eventType, :page_number, :venues
	
	def initialize
		@areas = []
		@mealOptions = []
		@capacity = []
		@budget = []
		@amenities_name = []
		@amenities_val = []
		@rating = []
		@eventType = []
		@venues = []
	end
end

