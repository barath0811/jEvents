class ChangeDefaultValueInSeatingArrangements < ActiveRecord::Migration
  def change
    change_column :seating_arrangements, :capacity_theatre, :integer, :default => nil
    change_column :seating_arrangements, :capacity_ushape, :integer, :default => nil
    change_column :seating_arrangements, :capacity_doubleu, :integer, :default => nil
    change_column :seating_arrangements, :capacity_classroom, :integer, :default => nil
    change_column :seating_arrangements, :capacity_board, :integer, :default => nil
    change_column :seating_arrangements, :capacity_roundtable, :integer, :default => nil    
  end
end
