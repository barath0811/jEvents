class CreateSeatingArrangements < ActiveRecord::Migration
  def change
    create_table :seating_arrangements do |t|
      t.references :hall
      t.string :arrangement_type
      t.integer :capacity

      t.timestamps
    end
    add_index :seating_arrangements, :hall_id
  end
end
