class AddColumnHrFesemCs < ActiveRecord::Migration[6.1]
  def change
    add_column :hr_fesem_cs, :status, :string
    add_column :hr_fesem_cs, :debithead, :string
    add_column :hr_fesem_cs, :slotdate, :date
    add_column :hr_fesem_cs, :slottime, :time
    change_column(:hr_fesem_cs,:sample,:integer)
    
  end
end
