class Rating < ActiveRecord::Base
  belongs_to :user
  belongs_to :venue
  attr_accessible :rating

  def self.getCount(venue_id)
  	where(:venue_id => venue_id).count
  end

  def self.getAverage(venue_id, count)
  	@sum = where(:venue_id => venue_id).sum(:rating)
  	@sum.to_f/count.to_f
  end
  
end
