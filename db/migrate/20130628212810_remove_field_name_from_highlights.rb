class RemoveFieldNameFromHighlights < ActiveRecord::Migration
  def up
    remove_column :highlights, :references
    remove_column :highlights, :venue
  end

  def down
    add_column :highlights, :venue, :string
    add_column :highlights, :references, :string
  end
end
