class Rate < ActiveRecord::Base
	attr_accessible :max_total_budget, :min_total_budget, :nonveg_plate_cost, :veg_plate_cost

	belongs_to :venue

	#Validations

	validates :nonveg_plate_cost, :veg_plate_cost, :min_total_budget, :max_total_budget, :presence => true
	validates :max_total_budget, :numericality => { :greater_than_or_equal_to => :min_total_budget }
end
