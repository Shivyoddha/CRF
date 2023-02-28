class AddColumnToIcp < ActiveRecord::Migration[6.1]
  def change
    add_column :icp_ms, :status, :string
    add_column :icp_ms, :debit, :string
    add_column :icp_ms, :slottime, :time
    add_column :icp_ms, :slotdate, :date
    add_column :icp_ms, :acid, :string
    add_column :icp_ms, :storage_condition, :string
    change_column(:icp_ms,:sample,:integer)

  end
end
