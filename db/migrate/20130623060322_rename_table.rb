class RenameTable < ActiveRecord::Migration
  def change
  	rename_table :suittable_events, :suitable_events
  end
end
