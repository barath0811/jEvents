class FixColumnName < ActiveRecord::Migration
  def change
    change_table :venues do |t|
      t.rename :isApproved, :is_approved
    end
  end
end
