class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|

      t.decimal :OverallRating
      t.decimal :PopularityIndex
      t.integer :NumViewers
      t.integer :NumEnquiries
      t.integer :NumBookings

      t.references :Venue
      t.references :EventHall
      
      t.timestamps
    end
    add_index :statistics, :Venue_id
    add_index :statistics, :EventHall_id
  end
end
