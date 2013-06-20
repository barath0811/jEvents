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
	
end
