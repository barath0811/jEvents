class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :venue
      t.string :firstname
      t.string :lastname
      t.string :email
      t.string :stdcode
      t.string :landline_number
      t.string :mobile_number

      t.timestamps
    end
    add_index :contacts, :venue_id
  end
end
