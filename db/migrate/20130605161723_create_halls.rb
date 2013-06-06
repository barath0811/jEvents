class CreateHalls < ActiveRecord::Migration
  def change
    create_table :halls do |t|
      t.references :venue
      t.string :name
      t.string :hall_type
      t.string :pricing_mode
      t.decimal :hall_rent

      t.timestamps
    end
    add_index :halls, :venue_id
  end
end
