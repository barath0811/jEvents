class Facility < ActiveRecord::Base
  
  attr_accessible :has_buffet, :has_parking, :is_alcohol_allowed, :is_nonveg_allowed

  belongs_to :venue
end
