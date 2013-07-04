class AddReviewCountToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :review_count, :int
  end
end
