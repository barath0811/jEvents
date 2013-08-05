class ChangePlanCaseInVenue < ActiveRecord::Migration
	def change
		change_table :venues do |t|
			t.rename :Plan, :plan
		end
		Venue.update_all( "plan = ?", 10 )
		change_column :venues, :plan, :integer, :default => 10, :null => false
	end
end