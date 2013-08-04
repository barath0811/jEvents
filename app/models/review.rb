class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  attr_accessible :review, :is_approved, :approved_by
end
