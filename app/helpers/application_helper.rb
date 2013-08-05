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

	def getPlans(optionName)
		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		options = []

		doc.elements.each('//'+optionName+'/option') do |ele|
			planAttr = PlanAttr.new
			planAttr.text = ele.attributes()["displayText"]
			planAttr.value = ele.attributes()["value"]

			options << planAttr
		end

		return options
	end

	def getPlanValue(text, optionName)
		file = File.new("app/assets/xml/Properties.xml")
		doc = REXML::Document.new file
		
		doc.elements.each('//'+optionName+'/option') do |ele|
			if ele.attributes()["displayText"] == text
				return ele.attributes()["value"]
			end
		end
	end

	
	def paginate(collection, params= {})
		will_paginate collection, params.merge(:renderer => RemoteLinkPaginationHelper::LinkRenderer)
	end
	
end
