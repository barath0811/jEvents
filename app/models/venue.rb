class Venue < ActiveRecord::Base
	attr_accessible :Name, :NumHalls, :Type

	has_one :addresses
	accepts_nested_attributes_for :addresses, :allow_destroy => true
	
	def self.search(query)
		JeventzLogger.debug "query == #{query.inspect}"
		find(:all)
	end
end
