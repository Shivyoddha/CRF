class AddColumnScratch < ActiveRecord::Migration[6.1]
  def change
    add_column :scratch_indentations, :status, :string
    add_column :scratch_indentations, :slottime, :time
    add_column :scratch_indentations, :slotdate, :date
    add_column :scratch_indentations, :debit, :string
    change_column(:scratch_indentations,:sample,:integer)
    add_column :scratch_indentations, :stype, :string
    remove_column :scratch_indentations,:type
  end
end
