class Address < ActiveRecord::Base
	attr_accessible :address, :area, :landmark, :phone_numbers

	belongs_to :venue

	#validations
	validates :address, :area, presence: true

end
