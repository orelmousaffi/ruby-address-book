class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :contact_id
      t.string :street_name
      t.string :city
      t.string :province
      t.string :postal_code

      t.timestamps null: false
    end
  end
end
