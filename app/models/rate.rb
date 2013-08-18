class Rate < ActiveRecord::Base
	attr_accessible :max_total_budget, :min_total_budget, :nonveg_plate_cost, :veg_plate_cost, :snack_plate_cost, :drinks_cost

	belongs_to :venue

	#Validations

#	validates :min_total_budget, :max_total_budget, :presence => true
#	validates :max_total_budget, :numericality => { :greater_than_or_equal_to => :min_total_budget }

  validates :nonveg_plate_cost, :veg_plate_cost, :snack_plate_cost, :drinks_cost, :numericality => true, :allow_blank => true,
            :format => { :with => /^\d{1,4}(\.\d{1,2})?$/, :message => "Enter a postive integer with maximum 4 digits and maximum 2 decimal places" }
end
