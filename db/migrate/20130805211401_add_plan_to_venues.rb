class AddPlanToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :Plan, :int
  end
end
