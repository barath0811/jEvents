class AddColumnsToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :base_image, :binary
    add_column :venues, :num_halls, :int
    add_column :venues, :min_capacity, :int
    add_column :venues, :max_capacity, :int
  end
end
