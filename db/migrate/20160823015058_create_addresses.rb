class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :street_name

      t.timestamps null: false
    end
  end
end
