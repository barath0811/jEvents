class CreatePricingHalls < ActiveRecord::Migration
  def change
    create_table :pricing_halls do |t|
      t.references :hall
      t.boolean :per_pax
      t.decimal :rent_per_pax, :precision => 10, :scale => 2
      t.decimal :rent_per_pax_duration, :precision => 5, :scale => 2
      t.string :rent_per_pax_duration_unit
      t.boolean :hall_space
      t.decimal :rent_hall_space, :precision => 10, :scale => 2
      t.decimal :rent_hall_space_duration, :precision => 5, :scale => 2
      t.string :rent_hall_space_duration_unit

      t.timestamps
    end
    add_index :pricing_halls, :hall_id
  end
end
