class CreateEvents < ActiveRecord::Migration
	def change
		create_table :events do |t|

			t.string :EventType, :length => 100, :null => true

			t.references :Venue

			t.timestamps
		end
		add_index :events, :Venue_id
	end
end
