class AddForeignKeys < ActiveRecord::Migration
  def change
    add_foreign_key :addresses, :contacts, on_delete: :cascade
  end
end
