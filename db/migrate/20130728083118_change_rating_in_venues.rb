class ChangeRatingInVenues < ActiveRecord::Migration
  def up
  	change_column :venues, :rating, :decimal, :precision => 10, :scale => 2
  end

  def down
  end
end

