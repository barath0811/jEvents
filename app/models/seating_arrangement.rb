class SeatingArrangement < ActiveRecord::Base
	
  attr_accessible   :capacity_theatre, 
  					:capacity_ushape, 
  					:capacity_doubleu,
  					:capacity_classroom, 
  					:capacity_board, 
  					:capacity_roundtable,
            :capacity_cluster,
            :capacity_informal,
            :capacity_seating,
            :capacity_dining,
            :capacity_reception,
            :capacity_workshop,
            :capacity_interview,
            :capacity_cocktail,
            :capacity_rectangle,
            :capacity_hollow,
            :capacity_oval

  belongs_to :hall
  
  validates :capacity_theatre, 
  					:capacity_ushape, 
  					:capacity_doubleu,
  					:capacity_classroom, 
  					:capacity_board, 
  					:capacity_roundtable,
            :capacity_cluster,
            :capacity_informal,
            :capacity_seating,
            :capacity_dining,
            :capacity_reception,
            :capacity_workshop,
            :capacity_interview,
            :capacity_cocktail,
            :capacity_rectangle,
            :capacity_hollow,
            :capacity_oval,
            :numericality => true, :allow_blank => true, :format => { :with => /^\d{1,7}$/, :message => "Enter a whole number with maximum 7 digits" }
end
