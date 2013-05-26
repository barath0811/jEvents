class Amenities < ActiveRecord::Base
	attr_accessible :IsAlcoholAllowed, :IsCarParkingAvailable, :IsCreditCardAccepted, :IsExternalCateringAllowed, :IsNonVegAllowed, :IsRestaurantAvailable

	belongs_to :Venue
end
