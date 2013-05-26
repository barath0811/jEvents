class Hall < ActiveRecord::Base
  attr_accessible :Capacity, :HallType, :Name

  belongs_to :Venue
  has_one :Statistics
end
