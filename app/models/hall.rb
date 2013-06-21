class Hall < ActiveRecord::Base

	attr_accessible :hall_rent, :name, :pricing_mode, :hall_type, :seating_arrangement_attributes

	belongs_to :venue
	has_one :seating_arrangement, :dependent => :destroy
	accepts_nested_attributes_for :seating_arrangement

  	#Validations
  	validates :name, :presence =>true
  	validates :hall_type, :presence =>true
  	validates :pricing_mode, :presence =>true
  	validates :hall_rent, :presence =>true
end
