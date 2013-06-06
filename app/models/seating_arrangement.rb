class SeatingArrangement < ActiveRecord::Base
  attr_accessible :capacity, :arrangement_type

  belongs_to :hall
end
