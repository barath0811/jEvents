class CreateAreas < ActiveRecord::Migration
  def change
    create_table :areas do |t|
      t.string :area1
      t.string :area2
      t.decimal :distance

      t.timestamps
    end
  end
end
