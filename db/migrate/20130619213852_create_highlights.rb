class CreateHighlights < ActiveRecord::Migration
  def change
    create_table :highlights do |t|
      t.string :highlight
      t.decimal :display_order
      t.string :references
      t.string :venue

      t.timestamps
    end
  end
end
