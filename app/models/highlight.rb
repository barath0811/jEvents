class Highlight < ActiveRecord::Base
  attr_accessible :display_order, :highlight

  belongs_to :venue
end
