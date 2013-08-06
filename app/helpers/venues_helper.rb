module VenuesHelper
	
	require 'rubygems'
	require 'net/http'
	require 'rexml/document'

	def populateSearchCriteria
		query = SearchCriteria.new

		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		
		query.areas << ['All areas', '']
		doc.elements.each('//Area/option') do |ele|
			query.areas << [ele.text, ele.text]  #Now the options are text-value pairs.
		end

		doc.elements.each('//Meal/option') do |ele|
			query.mealOptions << ele.text
		end

		doc.elements.each('//Budget/option') do |ele|
			query.budget << ele.text
		end

		doc.elements.each('//Capacity/option') do |ele|
			query.capacity << ele.text
		end

		doc.elements.each('//Amenities/option') do |ele|
			query.amenities_name << ele.text
		end

		doc.elements.each('//Amenities/column') do |ele|
			query.amenities_val << ele.text
		end

		doc.elements.each('//Rating/option') do |ele|
			query.rating << ele.text
		end

		doc.elements.each('//EventType/option') do |ele|
			query.eventType << ele.text
		end

		return query

	end

end