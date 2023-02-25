class AddColumnThreeDNon < ActiveRecord::Migration[6.1]
  def change
    add_column :three_d_non_contacts, :status, :string
    add_column :three_d_non_contacts, :slottime, :time
    add_column :three_d_non_contacts, :slotdate, :date
    add_column :three_d_non_contacts, :debit, :string
    change_column(:three_d_non_contacts,:sample,:integer)
    remove_column :three_d_non_contacts ,:range
    add_column :three_d_non_contacts, :xrange, :float
    add_column :three_d_non_contacts, :yrange, :float
  end
end
