class CreateVenues < ActiveRecord::Migration
	def change
		create_table :venues do |t|

			t.string :Name, :length=>150, :null => false
			t.string :Type, :length=>100, :null => false
			t.integer :NumHalls, :default => 1, :null => false
			
			t.references :Address
			t.references :MealInfo
			t.references :Amenities
			t.references :Statistics

			t.timestamps
		end
		
		add_index :venues, :Address_id
		add_index :venues, :MealInfo_id
		add_index :venues, :Amenities_id
		add_index :venues, :Statistics_id
	end
end
