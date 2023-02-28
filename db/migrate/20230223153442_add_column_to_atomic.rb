class AddColumnToAtomic < ActiveRecord::Migration[6.1]
  def change
    add_column :atomic_force_microscopes, :status, :string
    add_column :atomic_force_microscopes, :debit, :string
    add_column :atomic_force_microscopes, :slottime, :time
    add_column :atomic_force_microscopes, :slotdate, :date
    change_column(:atomic_force_microscopes,:sample,:integer)
    change_column(:atomic_force_microscopes,:x,:float)
    change_column(:atomic_force_microscopes,:y,:float)
    change_column(:atomic_force_microscopes,:scan_rate,:float)

  end
end
