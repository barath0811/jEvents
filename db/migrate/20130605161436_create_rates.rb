class CreateRates < ActiveRecord::Migration
  def change
    create_table :rates do |t|
      t.references :venue
      t.decimal :veg_plate_cost
      t.decimal :nonveg_plate_cost
      t.decimal :min_total_budget
      t.decimal :max_total_budget

      t.timestamps
    end
    add_index :rates, :venue_id
  end
end
