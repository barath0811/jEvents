class SearchCriteria
	attr_accessor :areas, :mealOptions, :capacity, :budget, :amenities_name, :amenities_val, :rating, :eventType
	
	class Amenities
		attr_accessor :name, :value
	end

	def initialize
		@areas = []
		@mealOptions = []
		@capacity = []
		@budget = []
		@amenities_name = []
		@amenities_val = []
		@rating = []
		@eventType = []
	end
end

