class RemoveFieldsFromHalls < ActiveRecord::Migration
  def up
    remove_column :halls, :pricing_mode
    remove_column :halls, :hall_rent
  end

  def down
    add_column :halls, :hall_rent, :decimal
    add_column :halls, :pricing_mode, :string
  end
end
