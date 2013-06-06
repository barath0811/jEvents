class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.references :venue
      t.references :hall
      t.binary :image
      t.string :caption
      t.boolean :can_showcase

      t.timestamps
    end
    add_index :images, :venue_id
    add_index :images, :hall_id
  end
end
