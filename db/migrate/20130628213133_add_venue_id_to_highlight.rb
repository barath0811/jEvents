class AddVenueIdToHighlight < ActiveRecord::Migration
  def change
    add_column :highlights, :venue_id, :integer
  end
end
