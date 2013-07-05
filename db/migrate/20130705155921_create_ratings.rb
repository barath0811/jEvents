class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.references :user
      t.references :venue
      t.integer :rating

      t.timestamps
    end
    add_index :ratings, :user_id
    add_index :ratings, :venue_id
  end
end
