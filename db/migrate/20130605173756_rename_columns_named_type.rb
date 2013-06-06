class RenameColumnsNamedType < ActiveRecord::Migration
  def up
    rename_column :venues, :type, :venue_type
    rename_column :halls, :type, :hall_type
    rename_column :seating_arrangements, :type, :arrangement_type
  end

  def down
  end
end
