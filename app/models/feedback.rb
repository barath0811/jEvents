class Feedback < ActiveRecord::Base
  attr_accessible :email, :feedback, :name, :subject
end
