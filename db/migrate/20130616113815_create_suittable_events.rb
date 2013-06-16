class CreateSuittableEvents < ActiveRecord::Migration
  def change
    create_table :suittable_events do |t|
      t.string :name
      t.references :venue

      t.timestamps
    end
  end
end
