class AddColumnToIc < ActiveRecord::Migration[6.1]
  def change
    remove_column :icp_ms, :storage
    add_column :icp_ms, :temp, :string



  end
end
