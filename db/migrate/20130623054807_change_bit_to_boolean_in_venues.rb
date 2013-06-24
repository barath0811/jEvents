class ChangeBitToBooleanInVenues < ActiveRecord::Migration
  def change
    change_column :venues, :view_available, :boolean, :default => false
    change_column :venues, :booking_available, :boolean, :default => false
    change_column :venues, :enquiry_available, :boolean, :default => false
  end
end
