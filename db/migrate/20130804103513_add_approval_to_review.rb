class AddApprovalToReview < ActiveRecord::Migration
  def change
    add_column :reviews, :is_approved, :boolean
    add_column :reviews, :approved_by, :integer
  end
end
