class ChangeColmnHrFesemCs < ActiveRecord::Migration[6.1]
  def change
    remove_column :hr_fesem_cs, :debithead, :string
    add_column :hr_fesem_cs, :debit, :string
  end
end
