class AddColumnsToRates < ActiveRecord::Migration
  def change
    add_column :rates, :snack_plate_cost, :decimal
    add_column :rates, :drinks_cost, :decimal
  end
end
