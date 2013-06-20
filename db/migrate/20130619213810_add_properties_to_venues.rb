class AddPropertiesToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :popularity_index, :decimal
    add_column :venues, :view_available, :bit
    add_column :venues, :booking_available, :bit
    add_column :venues, :enquiry_available, :bit
  end
end
