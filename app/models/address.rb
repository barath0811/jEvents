class Address < ActiveRecord::Base
  attr_accessible :Address, :Landmark, :Location, :PhoneNumbers

	has_one :venue
end
