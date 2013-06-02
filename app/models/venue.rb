class Venue < ActiveRecord::Base
	attr_accessible :Name, :NumHalls, :Type, :address_attributes

	belongs_to :address
	accepts_nested_attributes_for :address, :allow_destroy => true
	
	def self.search(query)
		JeventzLogger.debug "query == #{query.inspect}"
		find(:all)
	end
end
