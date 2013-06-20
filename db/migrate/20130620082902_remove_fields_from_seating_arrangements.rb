class RemoveFieldsFromSeatingArrangements < ActiveRecord::Migration
  def up
    remove_column :seating_arrangements, :arrangement_type
    remove_column :seating_arrangements, :capacity
  end

  def down
    add_column :seating_arrangements, :capacity, :int
    add_column :seating_arrangements, :arrangement_type, :string
  end
end
