class AddColumnRaman < ActiveRecord::Migration[6.1]
  def change
    add_column :raman_microscopes, :status, :string
    add_column :raman_microscopes, :slottime, :time
    add_column :raman_microscopes, :slotdate, :date
    add_column :raman_microscopes, :debit, :string
    change_column(:raman_microscopes,:sample,:integer)
    add_column :raman_microscopes, :laser, :string
  end
end
