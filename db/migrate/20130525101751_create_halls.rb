class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.references :Venue
      t.string :Name
      t.integer :Capacity
      t.string :HallType
      t.references :Statistics

      t.timestamps
    end
    add_index :halls, :Venue_id
    add_index :halls, :Statistics_id
  end
end
