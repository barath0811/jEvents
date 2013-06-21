class AddDefaultsToTable < ActiveRecord::Migration
  def change
  	change_column :seating_arrangements, :capacity_theatre, :int, :default => 0
    change_column :seating_arrangements, :capacity_ushape, :int, :default => 0
    change_column :seating_arrangements, :capacity_doubleu, :int, :default => 0
    change_column :seating_arrangements, :capacity_classroom, :int, :default => 0
    change_column :seating_arrangements, :capacity_board, :int, :default => 0
    change_column :seating_arrangements, :capacity_roundtable, :int, :default => 0
  end
end
