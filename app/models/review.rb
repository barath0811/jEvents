class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  attr_accessible :rating, :review
end
