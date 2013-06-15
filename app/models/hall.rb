class Hall < ActiveRecord::Base
  
  attr_accessible :hall_rent, :name, :pricing_mode, :hall_type

  belongs_to :venue
  has_many :seating_arragements
end
