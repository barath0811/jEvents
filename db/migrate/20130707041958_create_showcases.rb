class CreateShowcases < ActiveRecord::Migration
	def change
		create_table :showcases, :id => false  do |t|
			t.integer :ord
			t.references :venue
		end
	end
end
