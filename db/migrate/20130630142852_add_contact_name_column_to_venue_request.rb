class AddContactNameColumnToVenueRequest < ActiveRecord::Migration
  def change
    add_column :venue_requests, :contact_name, :string
  end
end
