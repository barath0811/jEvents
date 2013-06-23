class MakeUserIdNotNullInVenues < ActiveRecord::Migration
  def change
  	change_column :venues, :user_id, :integer, :null => false
  end
end
