class RemoveRatingFromReview < ActiveRecord::Migration
  def up
    remove_column :reviews, :rating
  end

  def down
    add_column :reviews, :rating, :integer
  end
end
