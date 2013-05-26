class Address < ActiveRecord::Base
  attr_accessible :Address, :Landmark, :Location, :PhoneNumbers

	belongs_to :Venue
end
