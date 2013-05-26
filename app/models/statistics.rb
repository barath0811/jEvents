class Statistics < ActiveRecord::Base
  attr_accessible :NumBookings, :NumEnquiries, :NumViewers, :OverallRating, :PopularityIndex

  belongs_to :Venue
  belongs_to :EventHall
end
