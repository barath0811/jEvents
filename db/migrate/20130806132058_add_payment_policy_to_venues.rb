class AddPaymentPolicyToVenues < ActiveRecord::Migration
  def change
    add_column :venues, :payment_policy, :text
  end
end
