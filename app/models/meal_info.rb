class MealInfo < ActiveRecord::Base
  attr_accessible :Food, :NonVegBuffetPricePerPlate, :VegBuffetPricePerPlate
end
