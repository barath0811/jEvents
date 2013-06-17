class Venue < ActiveRecord::Base
	attr_accessible :name, 
					:terms_conditions, 
					:venue_type,
					:base_image,
					:website,
					:user_id,
					:address_attributes,
					:contact_attributes,
					:rate_attributes,
					:images_attributes

	#associations
	belongs_to :user

	has_many :images, :dependent => :destroy
	has_many :halls, :dependent => :destroy
	has_one :facility, :dependent => :destroy
	has_one :address, :dependent => :destroy
	has_one :contact, :dependent => :destroy
	has_one :rate, :dependent => :destroy

	accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :contact, :allow_destroy => true
	accepts_nested_attributes_for :rate, :allow_destroy => true
	accepts_nested_attributes_for :images, :allow_destroy => true

	#validations
	validates :user_id, :presence => true
	validates :name, :presence => true, :length => { :minimum => 3 }
	validates :terms_conditions, :length => { :maximum => 1000 }
	validates :venue_type, :presence =>true
	validates_associated :address, :contact

	def base_image=(value)
    	write_attribute(:base_image, value.read)
  	end


	def self.search(query)
		JeventzLogger.debug "query == #{query.inspect}"
		#joins(:address).where('addresses.area' => query.areas).includes(:address)

		venue_results = joins(:address).includes(:address, :facility)

		unless query.areas.nil?
			venue_results = venue_results.joins(:address).where('addresses.area' => query.areas).includes(:address)
		end
		unless query.amenities.nil?

		end
			return venue_results.limit(10)
	end
end
