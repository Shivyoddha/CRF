class AddColumnToTri < ActiveRecord::Migration[6.1]
  def change
    add_column :tribometers, :status, :string
    add_column :tribometers, :debit, :string
    add_column :tribometers, :slottime, :time
    add_column :tribometers, :slotdate, :date
    add_reference :tribometers, :user, foreign_key: true
  end
end
