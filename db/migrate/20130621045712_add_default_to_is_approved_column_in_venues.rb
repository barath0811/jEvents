class AddDefaultToIsApprovedColumnInVenues < ActiveRecord::Migration
  def change
  	change_column :venues, :is_approved, :boolean, :default => false
  end
end
