class AddPlanToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :plan, :integer, :default => 10, :null => false
  end
end
