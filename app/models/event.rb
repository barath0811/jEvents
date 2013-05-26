class Event < ActiveRecord::Base
  attr_accessible :EventType

  belongs_to :Venue
end
