class CreateMealInfos < ActiveRecord::Migration
	def change
		create_table :meal_infos do |t|

			t.string :Food, :null => false
			t.decimal :VegBuffetPricePerPlate
			t.decimal :NonVegBuffetPricePerPlate

			t.timestamps
		end
	end
end
