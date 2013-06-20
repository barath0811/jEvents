class AddApprovedColumnToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :isApproved, :bit
  end
end
