class CreateAmenities < ActiveRecord::Migration
  def change
    create_table :amenities do |t|

      t.boolean :IsCarParkingAvailable
      t.boolean :IsRestaurantAvailable
      t.boolean :IsAlcoholAllowed
      t.boolean :IsCreditCardAccepted
      t.boolean :IsExternalCateringAllowed
      t.boolean :IsNonVegAllowed

      t.references :Venue

      t.timestamps
    end
    
    add_index :amenities, :Venue_id
  end
end
