class AddColumnToVenue < ActiveRecord::Migration
  def change
    add_column :venues, :rating_count, :int
  end
end
