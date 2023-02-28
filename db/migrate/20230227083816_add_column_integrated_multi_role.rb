class AddColumnIntegratedMultiRole < ActiveRecord::Migration[6.1]
  def change
    add_column :integrated_multi_role_testers, :status, :string
    add_column :integrated_multi_role_testers, :slottime, :time
    add_column :integrated_multi_role_testers, :slotdate, :date
    add_column :integrated_multi_role_testers, :debit, :string
    change_column(:integrated_multi_role_testers,:sample,:integer)
    add_column :integrated_multi_role_testers, :indentation, :string
    add_column :integrated_multi_role_testers, :stype, :string
    remove_column :integrated_multi_role_testers,:type
  end
end
