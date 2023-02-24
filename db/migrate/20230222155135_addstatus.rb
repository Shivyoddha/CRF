class Addstatus < ActiveRecord::Migration[6.1]
  def change
    add_column :hr_fesem_js, :status, :string
    add_column :hr_fesem_js, :slottime, :string
    add_column :hr_fesem_js, :slotdate, :string
    add_column :hr_fesem_js, :debit, :string
  end
end
