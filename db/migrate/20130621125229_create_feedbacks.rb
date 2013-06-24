class CreateFeedbacks < ActiveRecord::Migration
  def change
    create_table :feedbacks do |t|
      t.string :name, :null => false
      t.string :email, :null => false
      t.string :subject, :null => false
      t.text :feedback, :null => false, :limit => 500

      t.timestamps
    end
  end
end
