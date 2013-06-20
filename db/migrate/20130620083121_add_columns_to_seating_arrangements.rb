class AddColumnsToSeatingArrangements < ActiveRecord::Migration
  def change
    add_column :seating_arrangements, :capacity_theatre, :int
    add_column :seating_arrangements, :capacity_ushape, :int
    add_column :seating_arrangements, :capacity_doubleu, :int
    add_column :seating_arrangements, :capacity_classroom, :int
    add_column :seating_arrangements, :capacity_board, :int
    add_column :seating_arrangements, :capacity_roundtable, :int
  end
end
