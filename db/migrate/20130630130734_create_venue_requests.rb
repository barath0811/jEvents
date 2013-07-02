class CreateVenueRequests < ActiveRecord::Migration
  def change
    create_table :venue_requests do |t|
      t.string :name, :null => false
      t.string :area, :null => false
      t.string :contact_mobile
      t.string :contact_landline
      t.string :email
      t.string :user_ip
      t.references :user

      t.timestamps
    end
    add_index :venue_requests, :user_id
  end
end
