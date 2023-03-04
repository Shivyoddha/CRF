class AddColumnLaser < ActiveRecord::Migration[6.1]
  def change
    change_column(:lasers,:slotdate,:date)
    change_column(:lasers,:slottime,:time)
  end
end
