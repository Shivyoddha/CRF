class AddRoles< ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :admin_role
    remove_column :users, :chairman_role
    remove_column :users, :user_role
  end
end
