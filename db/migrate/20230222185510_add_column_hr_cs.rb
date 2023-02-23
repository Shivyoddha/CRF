class AddColumnHrCs < ActiveRecord::Migration[6.1]
  def change
    add_column :hr_fesem_cs, :status, :string
    add_column :hr_fesem_cs, :debit, :string
    add_column :hr_fesem_cs, :slottime, :time
    add_column :hr_fesem_cs, :slotdate, :date
    change_column(:hr_fesem_cs,:sample,:integer)
  end
end
