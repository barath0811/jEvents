class AddisVerifiedToVenues < ActiveRecord::Migration
  def change
  	add_column :venues, :is_verified, :boolean, :default => false
  end
end
