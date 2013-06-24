class SuitableEvent < ActiveRecord::Base
  attr_accessible :name

  belongs_to :venue
end