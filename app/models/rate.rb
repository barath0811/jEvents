class Rate < ActiveRecord::Base
  attr_accessible :max_total_budget, :min_total_budget, :nonveg_plate_cost, :veg_plate_cost

  belongs_to :venue
end
