class Hall < ActiveRecord::Base

	attr_accessible :name, :hall_type, :seating_arrangement_attributes, :pricing_hall_attributes

	belongs_to :venue
	has_one :seating_arrangement, :dependent => :destroy
  has_one :pricing_hall, :dependent => :destroy
	accepts_nested_attributes_for :seating_arrangement
  accepts_nested_attributes_for :pricing_hall

  	#Validations
  	validates :name, :presence =>true
  	validates :hall_type, :presence =>true
end
