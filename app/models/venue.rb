class Venue < ActiveRecord::Base
	attr_accessible :name, 
					:terms_conditions, 
					:venue_type,
					:website,
					:address_attributes,
					:contact_attributes,
					:images_attributes

	#associations
	has_many :images, :dependent => :destroy
	has_many :halls, :dependent => :destroy
	has_one :facility, :dependent => :destroy
	has_one :address, :dependent => :destroy
	has_one :contact, :dependent => :destroy
	has_one :rate, :dependent => :destroy

	accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :contact, :allow_destroy => true
	accepts_nested_attributes_for :images, :allow_destroy => true

	#validations
	#validates :type

	def self.search(query)
		JeventzLogger.debug "query == #{query.inspect}"
		find(:all)
	end
end
