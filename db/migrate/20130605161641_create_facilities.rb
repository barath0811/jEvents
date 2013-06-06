class CreateFacilities < ActiveRecord::Migration
  def change
    create_table :facilities do |t|
      t.references :venue
      t.boolean :has_parking
      t.boolean :has_buffet
      t.boolean :is_alcohol_allowed
      t.boolean :is_nonveg_allowed

      t.timestamps
    end
    add_index :facilities, :venue_id
  end
end
