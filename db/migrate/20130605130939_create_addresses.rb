class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.references :venue
      t.string :address
      t.string :area
      t.string :landmark
      t.string :phone_numbers

      t.timestamps
    end
    add_index :addresses, :venue_id
  end
end
