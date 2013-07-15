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

	def getBudgetRange(text, optionName)
		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		
		doc.elements.each('//'+optionName+'/option') do |ele|
			if ele.attributes()["displayText"] == text
				return ele.attributes()["min"], ele.attributes()["max"]
			end
		end
	end

	def getBudgetOrCapacity(optionName)
		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		options = []

		doc.elements.each('//'+optionName+'/option') do |ele|
			budgetOption = BudgetAttr.new
			budgetOption.text = ele.attributes()["displayText"]
			budgetOption.min = ele.attributes()["min"]
			budgetOption.max = ele.attributes()["max"]
			options << budgetOption
		end

		return options
	end

	
	def paginate(collection, params= {})
		will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
	end
	
end
