class Image < ActiveRecord::Base
  attr_accessible :can_showcase, :caption, :image

  belongs_to :venue
  belongs_to :hall
end
