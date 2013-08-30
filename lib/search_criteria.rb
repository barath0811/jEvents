class SearchCriteria
	attr_accessor :areas, :mealOptions, :capacity, :halltype,
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
		@halltype = []
		@venues = []
	end
end

