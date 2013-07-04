class Venue < ActiveRecord::Base
	attr_accessible :name, :description,:venue_type, :terms_conditions, :website, :base_image,					
					
					:num_halls, :min_capacity, :max_capacity,
					:is_approved, :view_available, :booking_available, :enquiry_available,
					:rating, :review_count,

					:user_id,
					:address_attributes,
					:contact_attributes,
					:rate_attributes,
					:facility_attributes,
					:images_attributes,
					:suitable_events_attributes,
					:highlights_attributes,
					:reviews_attributes

	#associations
	belongs_to :user

	has_many :images, :dependent => :destroy
	has_many :halls, :dependent => :destroy
	has_many :suitable_events, :dependent => :destroy
	has_many :highlights, :dependent => :destroy
	has_many :reviews, :dependent => :destroy
	has_one :facility, :dependent => :destroy
	has_one :address, :dependent => :destroy
	has_one :contact, :dependent => :destroy
	has_one :rate, :dependent => :destroy

	accepts_nested_attributes_for :address, :reject_if => lambda { |a| a[:address].blank? }, :allow_destroy => true
	accepts_nested_attributes_for :contact, :allow_destroy => true
	accepts_nested_attributes_for :rate, :allow_destroy => true
	accepts_nested_attributes_for :facility, :allow_destroy => true
	accepts_nested_attributes_for :images, :allow_destroy => true
	accepts_nested_attributes_for :suitable_events, :allow_destroy => true
	accepts_nested_attributes_for :highlights, :allow_destroy => true
	accepts_nested_attributes_for :halls, :allow_destroy => true
	accepts_nested_attributes_for :reviews, :allow_destroy => true


	#validations
	validates :user_id, :presence => true
	validates :name, :presence => true, :length => { :minimum => 3 }
	validates :description, :presence => true, :length => { :maximum => 500 }
	validates :terms_conditions, :length => { :maximum => 1000 }
	validates :venue_type, :presence =>true
	validates_associated :address, :contact

	#methods
	def base_image=(value)
    	write_attribute(:base_image, value.read)
  	end

	def self.search(query)
		venue_results = joins(:address).includes(:address, :facility, :suitable_events)

		unless query.areas.count == 0
			@areas = Area.where(:area1 => query.areas).where("distance <= 5").pluck(:area2)
			areas_search = Array.new
			areas_search << query.areas
			@areas.each do |a|
				areas_search << a
			end

			venue_results = venue_results.joins(:address).where('addresses.area' => areas_search).includes(:address)
			#venue_results = venue_results.joins("left outer join areas on addresses.area = areas.area1").where("areas.area1 is null or areas.distance <= 5")
		end
		
		query.amenities_val.each do |a| 
			venue_results = venue_results.joins(:facility).where('facilities.' + a => 1)
		end

		query.eventType.each do |a| 
			venue_results = venue_results.joins(:suitable_events).where('suitable_events.name' => a)
		end

		query.capacity.each do |a| 
			range = a.split('-')
			venue_results = venue_results.where("min_capacity <= ? or max_capacity >= ?", range[0], range[1])
		end
			
		return venue_results.paginate(:page => query.page_number, :per_page => 10), venue_results.count
	end
end
