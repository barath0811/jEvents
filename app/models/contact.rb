class Contact < ActiveRecord::Base
  
  attr_accessible :email, :firstname, :landline_number, :lastname, :mobile_number, :stdcode

  belongs_to :venue
end
