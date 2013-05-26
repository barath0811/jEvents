class SearchCriteria
	attr_accessor :areas, :mealOptions, :capacity, :budget, :amenities, :rating, :eventType

	def initialize
		@areas = []
		@mealOptions = []
		@capacity = []
		@budget = []
		@amenities = []
		@rating = []
		@eventType = []
	end
end