module ApplicationHelper

	def getOptions(optionName)
		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		options = Array.new

		doc.elements.each('//'+optionName+'/option') do |ele|
			options << ele.text
		end

		return options
	end
	
	def paginate(collection, params= {})
		will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
	end
end
