class Venue < ActiveRecord::Base
	attr_accessible :name, 
					:terms_conditions, 
					:venue_type,
					:base_image,
					:website,
					:min_capacity,
					:max_capacity,
					:address_attributes,
					:contact_attributes,
					:rate_attributes,
					:images_attributes

	#associations
	has_many :images, :dependent => :destroy
	has_many :halls, :dependent => :destroy
	has_many :suittable_events, :dependent => :destroy
	has_one :facility, :dependent => :destroy
	has_one :address, :dependent => :destroy
	has_one :contact, :dependent => :destroy
	has_one :rate, :dependent => :destroy


	accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :contact, :allow_destroy => true
	accepts_nested_attributes_for :rate, :allow_destroy => true
	accepts_nested_attributes_for :images, :allow_destroy => true
	accepts_nested_attributes_for :suittable_events, :allow_destroy => true

	#validations
	validates :name, :presence =>true, :length => { :minimum => 3 }
	validates :terms_conditions, :length => { :maximum => 1000 }
	validates :venue_type, :presence =>true
	validates_associated :address, :contact

	def base_image=(value)
    	write_attribute(:base_image, value.read)
  	end


	def self.search(query)
		JeventzLogger.debug "query == #{query.inspect}"
		#joins(:address).where('addresses.area' => query.areas).includes(:address)

		venue_results = joins(:address).includes(:address, :facility, :suittable_events)

		unless query.areas.count == 0
			venue_results = venue_results.joins(:address).where('addresses.area' => query.areas).includes(:address)
		end
		
		query.amenities_val.each do |a| 
			venue_results = venue_results.joins(:facility).where('facilities.' + a => 1)
		end

		query.eventType.each do |a| 
			venue_results = venue_results.joins(:suittable_events).where('suittable_events.name' => a)
		end

		query.capacity.each do |a| 
			range = a.split('-')
			venue_results = venue_results.where("min_capacity <= ? or max_capacity >= ?", range[0], range[1])
		end
			
		return venue_results.paginate(:page => query.page_number, :per_page => 10), venue_results.count
	end
end
