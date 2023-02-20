class AddColumnToUs < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :slotbooker, :string
    remove_column :users, :user_role

  end
end
