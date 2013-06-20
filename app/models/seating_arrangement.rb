class SeatingArrangement < ActiveRecord::Base
	
  attr_accessible   :capacity_theatre, 
  					:capacity_ushape, 
  					:capacity_doubleu,
  					:capacity_classroom, 
  					:capacity_board, 
  					:capacity_roundtable

  belongs_to :hall
end
