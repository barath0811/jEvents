class RenameIsApprovedToIsVerified < ActiveRecord::Migration
  def change
  	change_table :reviews do |t|
      t.rename :is_approved, :is_verified
      t.rename :approved_by, :verified_by
    end
  end
end
