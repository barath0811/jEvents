class PricingHall < ActiveRecord::Base
  belongs_to :hall
  attr_accessible :hall_space, :per_pax, :rent_hall_space, :rent_hall_space_duration, :rent_hall_space_duration_unit, :rent_per_pax, :rent_per_pax_duration, :rent_per_pax_duration_unit
  
  validates :rent_per_pax, :rent_hall_space, :numericality => true, :allow_blank => true,
            :format => { :with => /^\d{1,8}(\.\d{1,2})?$/, :message => "Enter a postive integer with maximum 8 digits and maximum 2 decimal places" }
  validates :rent_per_pax_duration, :rent_hall_space_duration, :numericality => true, :allow_blank => true,
            :format => { :with => /^\d{1,3}(\.\d{1,2})?$/, :message => "Enter a postive integer with maximum 3 digits and maximum 2 decimal places" }
end
