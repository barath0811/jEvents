module VenuesHelper
	
	require 'rubygems'
	require 'net/http'
	require 'rexml/document'

	def populateSearchCriteria
		query = SearchCriteria.new

		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		
		doc.elements.each('//Area/option') do |ele|
			# JeventzLogger.debug "#{query.inspect}"
			# JeventzLogger.debug ele.text
			query.areas << ele.text
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
			query.amenities << ele.text
		end

		doc.elements.each('//Rating/option') do |ele|
			query.rating << ele.text
		end

		doc.elements.each('//EventType/option') do |ele|
			query.eventType << ele.text
		end

		#JeventzLogger.debug "query == #{query.inspect}"
		return query

	end
end
