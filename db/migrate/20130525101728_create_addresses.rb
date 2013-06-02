class CreateAddresses < ActiveRecord::Migration
	def change
		create_table :addresses do |t|

			t.string :Address, :length=>350, :null => false
			t.string :Landmark, :length=>250
			t.string :Location, :length=>150, :null => false
			t.string :PhoneNumbers, :length=>50, :null => false

			t.timestamps
		end
	end
end
