class ChangeDecimalPrecisionInRates < ActiveRecord::Migration
  def change
    change_column :rates, :veg_plate_cost, :decimal, :precision => 6, :scale => 2
    change_column :rates, :nonveg_plate_cost, :decimal, :precision => 6, :scale => 2
    change_column :rates, :snack_plate_cost, :decimal, :precision => 6, :scale => 2
    change_column :rates, :drinks_cost, :decimal, :precision => 6, :scale => 2
    change_column :rates, :min_total_budget, :decimal, :precision => 10, :scale => 2
    change_column :rates, :max_total_budget, :decimal, :precision => 10, :scale => 2
  end
end
