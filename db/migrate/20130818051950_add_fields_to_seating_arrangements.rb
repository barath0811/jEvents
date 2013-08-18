class AddFieldsToSeatingArrangements < ActiveRecord::Migration
  def change
    add_column :seating_arrangements, :capacity_cluster, :integer
    add_column :seating_arrangements, :capacity_informal, :integer
    add_column :seating_arrangements, :capacity_seating, :integer
    add_column :seating_arrangements, :capacity_dining, :integer
    add_column :seating_arrangements, :capacity_reception, :integer
    add_column :seating_arrangements, :capacity_workshop, :integer
    add_column :seating_arrangements, :capacity_interview, :integer
    add_column :seating_arrangements, :capacity_cocktail, :integer
    add_column :seating_arrangements, :capacity_rectangle, :integer
    add_column :seating_arrangements, :capacity_hollow, :integer
    add_column :seating_arrangements, :capacity_oval, :integer
  end
end
