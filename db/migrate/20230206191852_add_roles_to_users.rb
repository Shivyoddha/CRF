class AddRolesToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :admin_role, :boolean
    add_column :users, :chairman_role, :boolean
    add_column :users, :user_role, :boolean
  end
end
