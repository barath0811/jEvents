class SearchController < ApplicationController


require 'rubygems'
require 'net/http'
require 'rexml/document'
	
	

  def query
  	
	file = File.new("app/assets/xml/Properties.xml" )
	doc = REXML::Document.new file
	@areas = []
	@mealOptions = []
	@capacity = []
	@budget = []
	@amenities = []
	@rating = []
	@eventType = []
	
	doc.elements.each('//Area/option') do |ele|
	   @areas << ele.text
	end

	doc.elements.each('//Meal/option') do |ele|
	   @mealOptions << ele.text
	end

	doc.elements.each('//Budget/option') do |ele|
	   @budget << ele.text
	end

	doc.elements.each('//Capacity/option') do |ele|
	   @capacity << ele.text
	end

	doc.elements.each('//Amenities/option') do |ele|
	   @amenities << ele.text
	end

	doc.elements.each('//Rating/option') do |ele|
	   @rating << ele.text
	end

	doc.elements.each('//EventType/option') do |ele|
	   @eventType << ele.text
	end


  end
end
