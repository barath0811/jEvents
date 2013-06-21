class AddColumnsToFeedback < ActiveRecord::Migration
  def change
    add_column :feedbacks, :user_ip, :string
    add_column :feedbacks, :feedback_date, :datetime
  end
end
