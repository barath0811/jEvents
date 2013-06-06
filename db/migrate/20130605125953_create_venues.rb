class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|
      t.string :name
      t.string :venue_type
      t.string :website
      t.text :terms_conditions

      t.timestamps
    end
  end
end
