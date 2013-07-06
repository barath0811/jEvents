class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :user
      t.references :venue
      t.string :review
      t.integer :rating

      t.timestamps
    end
    add_index :reviews, :user_id
    add_index :reviews, :venue_id
  end
end
