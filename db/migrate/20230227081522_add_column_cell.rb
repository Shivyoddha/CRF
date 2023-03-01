class AddColumnCell < ActiveRecord::Migration[6.1]
  def change
    add_column :cell_imagings, :status, :string
    add_column :cell_imagings, :slottime, :time
    add_column :cell_imagings, :slotdate, :date
    add_column :cell_imagings, :debit, :string
    change_column(:cell_imagings,:sample,:integer)
  end
end
