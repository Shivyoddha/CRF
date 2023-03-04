class AddColumnFesemj < ActiveRecord::Migration[6.1]
  def change
    change_column(:hr_fesem_js,:slotdate,:date)
    change_column(:hr_fesem_js,:slottime,:time)
  end
end
